//
//  Observer.h
//  KVC Operator
//
//  Created by Dharmesh on 06/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"
#import "Project.h"

@interface Observer : NSObject

@property Person    *person;
@property Employee  *employee;
@property Project   *project;

- (instancetype)init:(Person *)person;
- (instancetype)initWithEmployee:(Employee *)employee;

- (instancetype)initWithProject:(Project *)project employee:(Employee *)employee;

- (void)addEmployee:(Employee *)employee;
- (void)removeEmployee:(Employee *)employee;

@end
