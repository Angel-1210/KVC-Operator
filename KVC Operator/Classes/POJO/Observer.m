//
//  Observer.m
//  KVC Operator
//
//  Created by Dharmesh on 06/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import "Observer.h"
#import "MAKVONotificationCenter.h"

const char *observerFirstName;
const char *observerInitial;

@implementation Observer

- (void)dealloc {

    //[self.person removeObserver:self forKeyPath:@"FirstName"];
    //[self.project.employees removeObserver:self forKeyPath:@"self"];
    //[self.employee removeObserver:self forKeyPath:@"self"];
    
    [self.project removeObserver:self forKeyPath:@"data" context:&observerInitial];
}

- (instancetype)init:(Person *)person {

    if (self == [super init]) {
        
        self.person = person;
        //[self.person addObserver:self forKeyPath:@"FirstName" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:&observerFirstName];
    }
    return self;
}

- (instancetype)initWithEmployee:(Employee *)employee {
    
    if (self == [super init]) {
        
        self.employee = employee;
        //[self.employee addObserver:self forKeyPath:@"self" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionInitial) context:&observerInitial];
    }
    return self;
}

- (instancetype)initWithProject:(Project *)project employee:(Employee *)employee {
    
    if (self == [super init]) {
        
        self.project = project;
        self.employee = employee;
        
        //[self.project addObserver:self forKeyPath:@"employees" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionInitial) context:&observerInitial];
        //[self.project.employees willChangeValueForKey:@"self"];
        //[self.project.employees didChangeValueForKey:@"self"];
        //[self.project.employees addObserver:self forKeyPath:@"@self" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionInitial) context:&observerInitial];
        
        /*[self.project addObserver:self keyPath:@"projectName" options:(NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld) block:^(MAKVONotification *notification) {
            
            NSLog(@"Old Value :- %@", notification.oldValue);
            NSLog(@"Old Value :- %@", notification.newValue);
        }];*/

        [self.project addObserver:self
                         forKeyPath:@"data"
                            options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew)
                            context:&observerInitial];
        
        
    }
    return self;
}

//-----------------------------------------------------------------------

- (void)addEmployee:(Employee *)employee {
    
    [self.project insertObject:employee inDataAtIndex:0];
}

//-----------------------------------------------------------------------

- (void)removeEmployee:(Employee *)employee {    
    [self.project removeObjectFromDataAtIndex:0];
}

//-----------------------------------------------------------------------

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if (context == &observerInitial) {
        
        Project *cProject;
        Employee *cEmployee;
        
        if ([change[@"new"] isKindOfClass:[Project class]]) {
            cProject = change[@"new"];
        }
        
        if ([change[@"new"] isKindOfClass:[Employee class]]) {
            cEmployee = change[@"new"];
        }
        NSLog(@"%@ added %@ Employee", [self.project projectName], self.employee.name);

    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
