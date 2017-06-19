//
//  Dog.m
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "Dog.h"

@implementation Dog


- (void)dealloc {
    NSLog(@"Dog dealloc");
}
@end
