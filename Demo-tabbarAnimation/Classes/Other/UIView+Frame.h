//
//  UIView+Frame.h
//  Demo-tabbarAnimation
//
//  Created by Sun on 16/3/9.
//  Copyright © 2016年 jf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/** uiview的左边界 */
@property(nonatomic,assign) CGFloat left;
/** uiview的右边界 */
@property(nonatomic,assign) CGFloat right;
/** uiview的上边界 */
@property(nonatomic,assign) CGFloat top;
/** uiview的下边界 */
@property(nonatomic,assign) CGFloat bottom;

@property(nonatomic,assign) CGFloat width;

@property(nonatomic,assign) CGFloat height;

@end
