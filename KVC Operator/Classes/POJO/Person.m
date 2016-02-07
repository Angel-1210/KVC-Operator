//
//  Person.m
//  KVC Operator
//
//  Created by Dharmesh on 05/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import "Person.h"

@implementation Person

//@dynamic FirstName;
//@dynamic LastName;
//@dynamic FullName;
//@dynamic age;

- (instancetype)initWithFirstName:(NSString *)FirstName LastName:(NSString *)LastName age:(NSInteger)age {
    
    if (self == [super init]) {
        
        self.FirstName = FirstName;
        self.LastName = LastName;
        self.FullName = [[FirstName stringByAppendingString:@" "] stringByAppendingString:LastName];
        self.age = age;
    }
    return self;
}

@end
