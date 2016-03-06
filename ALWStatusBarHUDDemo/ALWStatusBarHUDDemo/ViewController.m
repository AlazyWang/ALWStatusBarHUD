//
//  ViewController.m
//  ALWStatusBarHUDDemo
//
//  Created by PRO on 16/3/6.
//  Copyright © 2016年 AlazyWang. All rights reserved.
//

#import "ViewController.h"
#import "ALWStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)success:(UIButton *)sender {
    [ALWStatusBarHUD showSuccess:@"成功"];
}
- (IBAction)error:(UIButton *)sender {
    [ALWStatusBarHUD showError:@"失败"];
}
- (IBAction)loading:(UIButton *)sender {
    [ALWStatusBarHUD showLoading:@"正在加载"];
}
- (IBAction)hide:(UIButton *)sender {
    [ALWStatusBarHUD hide];
}
- (IBAction)message:(UIButton *)sender {
    [ALWStatusBarHUD showMessage:@"没有什么事!!!" image:[UIImage imageNamed:@"check"]];
}

@end
