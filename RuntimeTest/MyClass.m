//
//  MyClass.m
//  RuntimeTest
//
//  Created by 陈欢 on 2018/6/4.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "MyClass.h"
@interface MyClass()

{
    NSInteger _instance1;
    NSString * _instance2;
}

@end

@implementation MyClass


+ (void)classMethod1 {
    
}


- (void)method1 {
    
    NSLog(@"调用method1");
}

- (void)method2 {
    
}

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2 {
    NSLog(@"arg1 : %ld, arg2 : %@", arg1, arg2);
}
@end
