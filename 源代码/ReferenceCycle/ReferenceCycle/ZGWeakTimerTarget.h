//
//  ZGWeakTimerTarget.h
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/16.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGWeakTimerTarget : NSObject


- (instancetype)initWithTarget:(id)target andSelector:(SEL)selector;


- (void)timerDidFile:(NSTimer *)timer;
@end
