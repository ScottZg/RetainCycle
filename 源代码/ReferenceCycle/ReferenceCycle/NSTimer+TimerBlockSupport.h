//
//  NSTimer+TimerBlockSupport.h
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (TimerBlockSupport)



+ (NSTimer *)tbs_scheduledTimerWithTimeInteveal:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)repeats;
@end
