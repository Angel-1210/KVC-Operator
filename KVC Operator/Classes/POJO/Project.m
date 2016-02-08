//
//  Project.m
//  KVC Operator
//
//  Created by Dharmesh on 05/02/16.
//  Copyright © 2016 Dharmesh. All rights reserved.
//

#import "Project.h"

@implementation Project

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"data"]) {
        return YES;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}

- (id)init {
    self = [super init];
    if (self) {
        // This is the ivar which provides storage
        _employees = [NSMutableArray array];
    }
    return self;
}

//  Just a convenience method
- (NSArray *)currentData {
    return [self dataAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [self countOfData])]];
}

//  These methods enable KVC compliance
- (void)insertObject:(id)object inDataAtIndex:(NSUInteger)index {
    self.employees[index] = object;
}

- (void)removeObjectFromDataAtIndex:(NSUInteger)index {
    [self.employees removeObjectAtIndex:index];
}

- (id)objectInDataAtIndex:(NSUInteger)index {
    return self.employees[index];
}

- (NSArray *)dataAtIndexes:(NSIndexSet *)indexes {
    return [self.employees objectsAtIndexes:indexes];
}

- (NSUInteger)countOfData {
    return [self.employees count];
}

@end
