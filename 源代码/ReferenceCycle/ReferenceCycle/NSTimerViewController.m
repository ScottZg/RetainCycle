//
//  NSTimerViewController.m
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "NSTimerViewController.h"
#import "NSTimer+TimerBlockSupport.h"
#import "ZGWeakTimerTarget.h"
@interface NSTimerViewController ()

@property (nonatomic,strong)NSTimer *timer;

@property (nonatomic,assign)NSInteger timeInteveal;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@end

@implementation NSTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //解决了循环引用
    ZGWeakTimerTarget *target = [[ZGWeakTimerTarget alloc] initWithTarget:self andSelector:@selector(timerDidFile:)];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:target selector:@selector(timerDidFile:) userInfo:nil repeats:YES];

//    //未解决
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerDidFile:) userInfo:nil repeats:YES];
//    
//    
//    //解决循环引用
//    __weak NSTimerViewController *weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf timerDidFile:timer];
//    }];
}

- (IBAction)stopTimerAction:(id)sender {
    [self.timer invalidate];
    self.timer = nil;
}
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    [self.timer invalidate];
//    self.timer = nil;
//}
#pragma mark - timer Action
- (void)timerDidFile:(NSTimer *)timer {
    self.timeInteveal++;
    self.timerLabel.text = [NSString stringWithFormat:@"%lds",(long)self.timeInteveal];
    NSLog(@"dd");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    [self.timer invalidate];
//    self.timer = nil;
}
#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"NSTimerViewController dealloc");
}
@end
