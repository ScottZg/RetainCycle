//
//  Person.m
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "Person.h"
#import "Dog.h"


@interface Person ()<DogDelegate>

@property (nonatomic,strong)Dog *dog;
@end


@implementation Person


- (instancetype)init {
    self = [super init];
    if (self) {
        self.dog = [[Dog alloc] init];
        self.dog.delegate = self;
    }
    return self;
}
- (void)dealloc {
    NSLog(@"Person dealloc");
}
@end
