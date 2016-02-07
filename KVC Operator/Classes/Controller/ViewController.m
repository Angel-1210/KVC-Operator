//
//  ViewController.m
//  KVC Operator
//
//  Created by Dharmesh on 05/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Project.h"
#import "Observer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    //https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/KeyValueCoding/Articles/CollectionOperators.html
    
   
    //@count
    //@avg
    //@sum
    //@max
    //@min
    //@distinctUnionOfObjects
    //@unionOfObjects
    //@distinctUnionOfArrays
    //@distinctUnionOfSets
    //NSLog(@"Total Elements %lf", [[arrayDigits valueForKeyPath:@"@avg.doubleValue"] doubleValue]);
    //NSLog(@"Total Elements %ld", [[arrObjects valueForKeyPath:@"@sum.age"] integerValue]);
    
    Employee *eDharmesh = [[Employee alloc] initWithName:@"eDharmesh" joiningDate:[NSDate date] releasedDate:nil];
    Employee *eTejas = [[Employee alloc] initWithName:@"eTejas" joiningDate:[NSDate date] releasedDate:nil];
    
    Project *projectOne = [[Project alloc] init];
    projectOne.projectName = @"Project One";
    projectOne.startDate = [NSDate date];
    projectOne.endDate = nil;
    projectOne.employees = [NSMutableArray arrayWithArray:@[ eDharmesh, eTejas ]];
    
    
    //eDharmesh = [[Employee alloc] initWithName:@"eDharmesh" joiningDate:[NSDate date] releasedDate:nil];
    //eTejas = [[Employee alloc] initWithName:@"eTejas" joiningDate:[NSDate date] releasedDate:nil];
    
    Project *projectTwo = [[Project alloc] init];
    projectTwo.projectName = @"Project Two";
    projectTwo.startDate = [NSDate dateWithTimeIntervalSinceNow:100];
    projectTwo.endDate = nil;
    projectTwo.employees = [NSMutableArray arrayWithArray:@[ eDharmesh, eTejas ]];
    
    
    //http://bou.io/KVCCustomOperators.html
    
    Employee *eMohil = [[Employee alloc] initWithName:@"eMohil" joiningDate:[NSDate date] releasedDate:nil];
    [projectOne.employees addObject:eMohil];
    
    NSInteger totalEmployeeProjOne = [[projectOne valueForKeyPath:@"employees.@count"] integerValue];
    NSLog(@"Project one has %ld dedicated employees", totalEmployeeProjOne);
    
    NSInteger totalEmployeeProjTwo = [[projectTwo valueForKeyPath:@"employees.@count"] integerValue];
    NSLog(@"Project Two has %ld dedicated employees", totalEmployeeProjTwo);
    
    //All projects Employee
    NSArray *arrProjects = @[ projectOne, projectTwo ];
    
    NSArray *arrEmployees = [[arrProjects valueForKeyPath:@"@distinctUnionOfObjects.employees"] valueForKeyPath:@"@unionOfArrays.self"];
    NSInteger total = [[arrEmployees valueForKeyPath:@"@count"] integerValue];
    NSLog(@"All project has %ld dedicated employees", total);
    
    //Unique projects Employee
    arrEmployees = [[arrProjects valueForKeyPath:@"@distinctUnionOfObjects.employees"] valueForKeyPath:@"@unionOfArrays.self"];
    NSArray  *arrayUniqueEmployees = [arrEmployees valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"All project has %@ dedicated employees", arrayUniqueEmployees);
    
    //All Employee
    arrEmployees = [[arrProjects valueForKeyPath:@"@distinctUnionOfObjects.employees"] valueForKeyPath:@"@unionOfArrays.self"];
    NSArray  *arrayAllEmployees = [arrEmployees valueForKeyPath:@"self"];
    
    //Employees working in both project
    NSMutableArray *personWorkingInBothProjects = [NSMutableArray arrayWithArray:arrayAllEmployees];
    [personWorkingInBothProjects removeObjectsInRange:NSMakeRange(0, arrayUniqueEmployees.count)];
    NSLog(@"%@", personWorkingInBothProjects);
    
    
   //Employees Working in Single Projects
    NSMutableArray *personWorkingInSingleProject = [NSMutableArray arrayWithArray:arrayAllEmployees];
    [personWorkingInSingleProject removeObjectsInArray:personWorkingInBothProjects];
    NSLog(@"%@", personWorkingInSingleProject);
    
    //Monitorking project
    Employee *eExtraResource = [[Employee alloc] initWithName:@"eExtraResource" joiningDate:[NSDate date] releasedDate:nil];
    __unused Observer *obserber = [[Observer alloc] initWithProject:projectOne employee:eExtraResource];
    
    [projectOne.employees addObject:eExtraResource];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
