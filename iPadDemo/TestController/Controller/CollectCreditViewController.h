//
//  CollectCreditViewController.h
//  WecashHD
//
//  Created by 张庆杰 on 16/3/10.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@class CollectCreditViewController;

@protocol CollectCreditViewControllerDelegate <NSObject>

@required
- (void)collectCreditViewController:(CollectCreditViewController *)ccVc didSelectedFromIndex:(NSInteger)from toIndex:(NSInteger)to;

@end

@interface CollectCreditViewController : BaseViewController

@property (nonatomic, weak) id<CollectCreditViewControllerDelegate> delegate;

@end
