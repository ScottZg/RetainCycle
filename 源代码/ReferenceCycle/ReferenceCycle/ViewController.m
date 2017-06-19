//
//  ViewController.m
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/14.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "ViewController.h"

#import "BViewController.h"
@interface ViewController ()<BVCDelegate>

@property (weak, nonatomic) IBOutlet UILabel *bTextLabel;

@property (nonatomic,strong)BViewController *bVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *arr1 = [NSMutableArray array];
    NSMutableArray *arr2 = [NSMutableArray array];
    
    [arr1 addObject:arr2];
    [arr2 addObject:arr1];
   
//    int i = 3;
//    switch (i) {
//        case 1:
//            NSLog(@"1");
//        case 3:
//            NSLog(@"3");
//        case 2:
//            NSLog(@"2");
//            
//        default:
//            return;
//    }
}

- (IBAction)showBVCAction:(UIButton *)sender {
    self.bVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BVC"];
    self.bVC.delegate = self;
    [self.navigationController pushViewController:self.bVC animated:YES];
}

#pragma mark - BVCDelegate
- (void)returnText:(NSString *)text {
    self.bTextLabel.text = text;
}

@end
