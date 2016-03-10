//
//  FirstViewController.m
//  Demo-tabbarAnimation
//
//  Created by Sun on 16/3/9.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    lab.font = [UIFont systemFontOfSize:16];
    lab.text = @"第一页";
    [self.view addSubview:lab];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
