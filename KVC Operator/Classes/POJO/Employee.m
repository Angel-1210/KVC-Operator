//
//  Employee.m
//  KVC Operator
//
//  Created by Dharmesh on 07/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (instancetype)initWithName:(NSString *)name joiningDate:(NSDate *)joiningDate releasedDate:(NSDate *)releasedDate {
    
    if (self == [super init]) {
        
        self.name = name;
        self.joiningDate = joiningDate;
        
        if (releasedDate == nil) {
            self.releaseDate = [NSDate date];
        }
        
        NSDate *fromDate;
        NSDate *toDate;
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                     interval:NULL forDate:self.releaseDate];
        [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                     interval:NULL forDate:self.joiningDate];
        
        NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                                   fromDate:fromDate toDate:toDate options:0];
        
        self.workingDays = [difference day];
        
    }
    return self;
}

@end
