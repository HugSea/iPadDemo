//
//  TabBar.h
//  WecashHD
//
//  Created by 张庆杰 on 16/3/10.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;

@protocol TabBarDelegate <NSObject>

@required
- (void)tabBar:(TabBar *)tabBar didSelectedFromIndex:(NSInteger)from toIndex:(NSInteger)to;

@end

@interface TabBar : UIView

@property (nonatomic, weak) id<TabBarDelegate> delegate;

// 设置约束
- (void)setupFrameWithY:(CGFloat)y;

@end
