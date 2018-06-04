//
//  ViewController.m
//  RuntimeTest
//
//  Created by 陈欢 on 2018/6/4.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "ViewController.h"
#import "MyClass.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    MyClass *myclass = [[MyClass alloc]init];
    
    unsigned int outCount = 0;
    
    Class cls = myclass.class;
    
    
    NSLog(@"类名 %s", class_getName(cls));
    
    NSLog(@"父类： %s", class_getName(class_getSuperclass(cls)));
    
    NSLog(@"是否有元类%@", (class_isMetaClass(cls) ? @"" : @"not"));
    
    
    Class meat_class = objc_getMetaClass(class_getName(cls));
    
    NSLog(@"%s  元类是 %s", class_getName(cls),class_getName(meat_class));
    
    
    NSLog(@"实例变量大小 %zu", class_getInstanceSize(cls));
    
    // 成员变量
    Ivar *ivars   =  class_copyIvarList(cls, &outCount);
    
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        
        NSLog(@"成员变量 名字: %s index: %d", ivar_getName(ivar), i);
    }
    
    free(ivars);
    
    
    Ivar string  = class_getInstanceVariable(cls, "_string");
    if (string != NULL) {
        NSLog(@"成员变量getInstanceVariable  %s", ivar_getName(string));
    }
    
    
    // 属性操作
    
    objc_property_t *properties = class_copyPropertyList(cls, &outCount);
    
    for (int i = 0 ; i < outCount; i++) {
        objc_property_t property = properties[i];
        
        NSLog(@"属性名：%s", property_getName(property));
    }
    
    free(properties);
    
    
    objc_property_t array = class_getProperty(cls, "array");
    
    if (array != NULL) {
        NSLog(@"属性class_getProperty%s", property_getName(array));
    }
    
    
    
    // 方法操作
    
    
    
    
    Method *methods = class_copyMethodList(cls, &outCount);
    
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        
        NSLog(@"方法名：%s", method_getName(method));
        
        
    }
    
    free(methods);
    
   // Method method1 = class_getInstanceMethod(cls, <#SEL  _Nonnull name#>)
    
    
    Method method1 = class_getInstanceMethod(cls, @selector(method1));
    
    if (method1 !=NULL) {
        NSLog(@"实例方法%s", method_getName(method1));
    }
    
    
    Method classMethod = class_getClassMethod(cls, @selector(classMethod1));
    if (classMethod != NULL) {
        NSLog(@"类方法 : %s", method_getName(classMethod));
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
