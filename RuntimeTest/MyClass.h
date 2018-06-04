//
//  MyClass.h
//  RuntimeTest
//
//  Created by 陈欢 on 2018/6/4.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject <NSCopying, NSCoding>

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy) NSString *string;

@end
