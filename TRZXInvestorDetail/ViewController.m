//
//  ViewController.m
//  TRZXInvestorDetail
//
//  Created by zhangbao on 2017/3/7.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "ViewController.h"
#import "Target_TRZXInvestorDetail.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIViewController *investorDetail_vc = [[Target_TRZXInvestorDetail new] Action_InvestorDetailViewController:nil];
    [self.navigationController pushViewController:investorDetail_vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
