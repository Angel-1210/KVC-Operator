//
//  Employee.h
//  KVC Operator
//
//  Created by Dharmesh on 07/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property NSString *name;
@property NSDate *joiningDate;
@property NSDate *releaseDate;
@property NSInteger workingDays;

- (instancetype)initWithName:(NSString *)name joiningDate:(NSDate *)joiningDate releasedDate:(NSDate *)releasedDate;

@end
