//
//  NSTimer+TimerBlockSupport.m
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "NSTimer+TimerBlockSupport.h"

@implementation NSTimer (TimerBlockSupport)



+ (NSTimer *)tbs_scheduledTimerWithTimeInteveal:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)repeats {
    NSTimer *timer = [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(tbs_blockInvoke:) userInfo:[block copy] repeats:repeats];
    return timer;
}


+ (void)tbs_blockInvoke:(NSTimer *)timer {
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}
@end
