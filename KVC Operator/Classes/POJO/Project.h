//
//  Project.h
//  KVC Operator
//
//  Created by Dharmesh on 05/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

@interface Project : NSObject

@property NSString  *projectName;
@property NSDate    *startDate;
@property NSDate    *endDate;

@property NSMutableArray <Employee *> *employees;

@end
