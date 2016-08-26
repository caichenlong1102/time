//
//  ViewController+Logging.m
//  time
//
//  Created by light on 16/6/3.
//  Copyright © 2016年 light. All rights reserved.
//

#import "ViewController+Logging.h"
#import "Logging.h"
#import <objc/runtime.h>

@implementation ViewController (Logging)

//-(void)swizzled_viewDidAppear:(BOOL)animated{
//    // call orignal implementation
//    
//    [self swizzled_viewDidAppear:animated];
//    
//    // Logging
//    [Logging logWithEventName:NSStringFromClass([self class])];
//
//}
//
//+ (void)load{
//    swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
//}
//
//void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector){
//    
//    // the method might not exist in the class, but in its superclass
//    Method originalMethod = class_getInstanceMethod(class, originalSelector);
//    
//    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//    
//    // class_addMethod will fail if original method already exists
//    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//    
//    // the method doesn’t exist and we just added one
//    if (didAddMethod) {
//        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//    }else{
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    }
//}

void (* gOriginalViewDidAppear)(id, SEL, BOOL);

void newViewDidAppear(UIViewController *self, SEL _cmd, BOOL animated)
{ // call original implementation
    gOriginalViewDidAppear(self, _cmd, animated); // Logging
    [Logging logWithEventName:NSStringFromClass([self class])];
}

+ (void)load
{
    Method originalMethod = class_getInstanceMethod(self, @selector(viewDidAppear:));
    gOriginalViewDidAppear = (void *)method_getImplementation(originalMethod);
    if(!class_addMethod(self, @selector(viewDidAppear:), (IMP) newViewDidAppear, method_getTypeEncoding(originalMethod))) {
        method_setImplementation(originalMethod, (IMP) newViewDidAppear);
    }
}

@end
