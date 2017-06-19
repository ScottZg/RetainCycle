//
//  CViewController.h
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^cVBlock)(NSString *text);

@interface CViewController : UIViewController




@property (nonatomic,copy)cVBlock cBlock;
@end
