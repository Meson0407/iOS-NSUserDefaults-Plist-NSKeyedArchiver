//
//  Person.h
//  归档)
//
//  Created by 薛涛 on 17/2/16.
//  Copyright © 2017年 Xuetao. All rights reserved.
//

#import <Foundation/Foundation.h>

// 归档必须遵守NSCoding协议
@interface Person : NSObject<NSCoding>

@property (nonatomic, assign) NSInteger personNumber;
@property (nonatomic, strong) NSString *personName;

@end
