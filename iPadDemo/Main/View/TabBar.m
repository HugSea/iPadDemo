//
//  TabBar.m
//  WecashHD
//
//  Created by 张庆杰 on 16/3/10.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import "TabBar.h"
#import "TabBarButton.h"
#import "UIView+Positioning.h"

typedef NS_ENUM(NSUInteger, TabBarButtonType) {
    TabBarButtonTypeImage,
    TabBarButtonTypeImageWithTitle
};

@interface TabBar ()

@property (nonatomic, strong) UIButton *selectedBtn;

@end

@implementation TabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupTabBarButtonWithTabBarButtonType:TabBarButtonTypeImageWithTitle andTitle:@"我是一" andImageName:@""];
        [self setupTabBarButtonWithTabBarButtonType:TabBarButtonTypeImageWithTitle andTitle:@"我是二" andImageName:@""];
        [self setupTabBarButtonWithTabBarButtonType:TabBarButtonTypeImageWithTitle andTitle:@"我是三" andImageName:@""];
        [self setupTabBarButtonWithTabBarButtonType:TabBarButtonTypeImageWithTitle andTitle:@"我是四" andImageName:@""];
        [self setupTabBarButtonWithTabBarButtonType:TabBarButtonTypeImageWithTitle andTitle:@"我是五" andImageName:@""];
        
        [self setupTabBarButtonWithTabBarButtonType:TabBarButtonTypeImage andTitle:@"First" andImageName:@""];
        [self setupTabBarButtonWithTabBarButtonType:TabBarButtonTypeImage andTitle:@"Second" andImageName:@""];
        [self setupTabBarButtonWithTabBarButtonType:TabBarButtonTypeImage andTitle:@"Third" andImageName:@""];
    }
    return self;
}

- (void)setupTabBarButtonWithTabBarButtonType:(TabBarButtonType)tabBarButtonType andTitle:(NSString *)title andImageName:(NSString *)imageName {
    if (tabBarButtonType == TabBarButtonTypeImageWithTitle) {
        // TabBarButton
        TabBarButton *btn = [TabBarButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor orangeColor];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.tag = self.subviews.count * 2;
        [btn addTarget:self action:@selector(tabBarButtonClickedWithButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    } else {
        // UIButton
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor greenColor];
        btn.tag = self.subviews.count * 2;
        [btn addTarget:self action:@selector(tabBarButtonClickedWithButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

- (void)tabBarButtonClickedWithButton:(UIButton *)btn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:didSelectedFromIndex:toIndex:)]) {
        [self.delegate tabBar:self didSelectedFromIndex:self.selectedBtn.tag toIndex:btn.tag];
    }
    self.selectedBtn = btn;
}

- (void)setupFrameWithY:(CGFloat)y {
    self.backgroundColor = [UIColor grayColor];
    self.width = self.superview.width;
    self.y = y;
    self.x = 0;
    self.height = [UIScreen mainScreen].bounds.size.height - y;
    
    CGFloat btnWidthTabBar = self.superview.width * 0.5;
    CGFloat btnWidthBottom = self.superview.width * 0.4;
    CGFloat marginTabBar = 10.0;
    CGFloat marginBottom = 20.0;
    CGFloat top = 10;
    for (UIButton *btn in self.subviews) {
        if ([btn isKindOfClass:[TabBarButton class]]) {
            btn.width = btnWidthTabBar;
            btn.height = btnWidthTabBar;
            btn.center = self.center;
            btn.y = top + marginTabBar;
            top = CGRectGetMaxY(btn.frame);
        } else {
            btn.width = btnWidthBottom;
            btn.height = btnWidthBottom;
            btn.center = self.center;
            btn.y = top + marginBottom;
            top = CGRectGetMaxY(btn.frame);
        }
    }
}

@end
