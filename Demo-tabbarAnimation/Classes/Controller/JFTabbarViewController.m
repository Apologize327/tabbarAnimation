//
//  JFTabbarViewController.m
//  Demo-tabbarAnimation
//
//  Created by Sun on 16/3/9.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "JFTabbarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "UIView+Frame.h"

@interface JFTabbarViewController (){
    UIView *_tabbarView;
    UIImageView *_folatImageView;
}

@property(nonatomic,strong) UIButton *selectedBtn;
@property(nonatomic,assign) BOOL isTransform; //标记图形是否已旋转

@end

@implementation JFTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildren];
    
    [self setUpCustomTabbar];
    
    self.isTransform = NO;
}

-(void)setUpChildren{
    FirstViewController *firstVc = [[FirstViewController alloc]init];
    SecondViewController *secondVc = [[SecondViewController alloc]init];
    ThirdViewController *thirdVc = [[ThirdViewController alloc]init];
    
    [self addChildViewController:firstVc];
    [self addChildViewController:secondVc];
    [self addChildViewController:thirdVc];
}

-(void)setUpCustomTabbar{
    CGSize tabbarSize = self.tabBar.frame.size;
    CGFloat tabbarY = self.tabBar.top;
    [self.tabBar removeFromSuperview];
    CGFloat clearViewH = 10;
    
    
    UIView *tabView = [[UIView alloc]initWithFrame:CGRectMake(0, clearViewH, tabbarSize.width, tabbarSize.height)];
    tabView.backgroundColor = [UIColor whiteColor];
    _tabbarView = tabView;
    
    UIView *clearView = [[UIView alloc]init];
    clearView.frame = CGRectMake(0, 0, tabView.width, clearViewH);
    clearView.backgroundColor = [UIColor clearColor];
    
    UIView *baseView = [[UIView alloc]init];
    baseView.frame = CGRectMake(0, tabbarY-clearViewH, tabView.width, tabView.height + clearViewH);
    [self.view addSubview:baseView];
    [baseView addSubview:tabView];
    [baseView addSubview:clearView];
    
    for (int i=0; i<3; i++) {
        UIButton *btn = [[UIButton alloc]init];
        NSString *imgName = [NSString stringWithFormat:@"tabbar_%d",i+1];
        NSString *imgHLName = [NSString stringWithFormat:@"tabbar_%dHL",i+1];
        
        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imgHLName] forState:UIControlStateSelected];
        
        CGFloat btnW = 30;
        CGFloat padding = (_tabbarView.width - 3*btnW)/4;
        CGFloat btnX = padding + i*(btnW + padding);
        if (1 != i) {
            btn.frame = CGRectMake(btnX, 10, 30, 30);
        } else {
            btn.frame = CGRectMake(_tabbarView.width/2 - 10, 0, 30, 30);
        }
        [_tabbarView addSubview:btn];
        
        btn.tag = i;
        [btn addTarget:self action:@selector(clickTheTabbarBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置默认选中按钮
        if (0 == i) {
            btn.selected = YES;
            self.selectedBtn = btn;
        }
    }
    
    UIImageView *floatImgView = [[UIImageView alloc]initWithFrame:CGRectMake(_tabbarView.width/2 - 10 - 15, 8, 30, 5)];
    floatImgView.image = [UIImage imageNamed:@"ic_ll_open1_30"];
    _folatImageView = floatImgView;
    //从左下角开始旋转
    _folatImageView.layer.anchorPoint = CGPointMake(0, 1);
    [clearView addSubview:_folatImageView];
}

-(void)clickTheTabbarBtn:(UIButton *)button{
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    self.selectedIndex = button.tag;
    
    if (1 != button.tag) {
        [self floatDown];
    } else {
        [self floatUp];
    }
}

-(void)floatUp{
    if (!self.isTransform) {
        [UIView animateWithDuration:1.0f animations:^{
            _folatImageView.layer.transform = CATransform3DMakeRotation(-20 * M_PI/180.0, 0, 0, 1);
        } completion:^(BOOL finished) {
            
        }];
    }
    self.isTransform = YES;
}

-(void)floatDown{
    if (self.isTransform) {
        [UIView animateWithDuration:1.0f animations:^{
            _folatImageView.layer.transform = CATransform3DMakeRotation(0, 0, 0, 0);
        } completion:^(BOOL finished) {
            
        }];
    }
    self.isTransform = NO;
}

@end
