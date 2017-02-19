//
//  Person.m
//  归档)
//
//  Created by 薛涛 on 17/2/16.
//  Copyright © 2017年 Xuetao. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.personName forKey:@"personName"];
    [aCoder encodeInteger:self.personNumber forKey:@"personNumber"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.personName = [aDecoder decodeObjectForKey:@"personName"];
        self.personNumber = [aDecoder decodeIntegerForKey:@"personNumber"];
    }
    return self;
}

@end
