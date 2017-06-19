//
//  CViewController.m
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@property (weak, nonatomic) IBOutlet UIView *colorView;

@property (weak, nonatomic) IBOutlet UILabel *cLabel;

@end

@implementation CViewController

//one
- (IBAction)changeColorAction:(UIButton *)sender {
    
    [UIView animateWithDuration:1 animations:^{
        if (self.colorView.backgroundColor == [UIColor blackColor]) {
            self.colorView.backgroundColor = [UIColor redColor];
        }else {
            self.colorView.backgroundColor = [UIColor blackColor];
        }
    } completion:^(BOOL finished) {
        NSLog(@"the color have changed");
    }];
    
}
// two
- (IBAction)setCLabelAction:(id)sender {
    //未解决循环引用
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
    self.cBlock = ^(NSString *text) {
        self.cLabel.text = text;
    };
    self.cBlock(@"C name");
#pragma clang diagnostic pop

//    已解决循环引用
    __weak CViewController *weakVC = self;
    self.cBlock = ^(NSString *text) {
        weakVC.cLabel.text = text;
    };
    self.cBlock(@"C name");
}



@end
