//
//  ZGWeakTimerTarget.m
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/16.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "ZGWeakTimerTarget.h"


@implementation ZGWeakTimerTarget
{
    __weak id _target;
    SEL _selector;
}

- (instancetype)initWithTarget:(id)target andSelector:(SEL)selector {
    self = [super init];
    if (self) {
        _target = target;
        _selector = selector;
    }
    return self;
}

- (void)timerDidFile:(NSTimer *)timer {
    if (_target) {
        //clang push&pop用于保存和回复编译器的状态，类似Core Graphics 或者OpenGL上下文
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [_target performSelector:_selector withObject:timer];
#pragma clang diagnostic pop
    }else {
        [timer invalidate];
    }
}
#pragma mark - dealloc method
- (void)dealloc {
    NSLog(@"ZGWeakTimerTarget dealloc");
}
@end
