//
//  Dog.h
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol DogDelegate <NSObject>



@end

@interface Dog : NSObject



@property (nonatomic,weak) id<DogDelegate>delegate;
@end
