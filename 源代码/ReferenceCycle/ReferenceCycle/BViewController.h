//
//  BViewController.h
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BVCDelegate <NSObject>

- (void)returnText:(NSString *)text;

@end

@interface BViewController : UIViewController


@property (nonatomic,strong)id<BVCDelegate> delegate;
@end
