//
//  Observer.m
//  KVC Operator
//
//  Created by Dharmesh on 06/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import "Observer.h"

const char *observerFirstName;
const char *observerInitial;

@implementation Observer

- (void)dealloc {

    //[self.person removeObserver:self forKeyPath:@"FirstName"];
    [self.project removeObserver:self forKeyPath:@"employees"];
    //[self.employee removeObserver:self forKeyPath:@"self"];
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
        
        [self.project addObserver:self forKeyPath:@"employees" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionInitial) context:&observerInitial];
        //[self.employee addObserver:self forKeyPath:@"self" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionInitial) context:&observerInitial];
    }
    return self;
}

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
