//
//  BViewController.m
//  ReferenceCycle
//
//  Created by zhanggui on 2017/6/15.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "BViewController.h"
#import "Person.h"

@interface BViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    Person *person = [[Person alloc] init];
//    NSLog(@"%@",person);

}
- (IBAction)backAction:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate returnText:self.myTextField.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)dealloc {
    NSLog(@"B VC release");
}
@end
