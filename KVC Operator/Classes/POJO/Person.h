//
//  Person.h
//  KVC Operator
//
//  Created by Dharmesh on 05/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *FirstName;
@property NSString *LastName;
@property NSString *FullName;
@property NSInteger age;

- (instancetype)initWithFirstName:(NSString *)FirstName LastName:(NSString *)LastName age:(NSInteger)age;

@end
