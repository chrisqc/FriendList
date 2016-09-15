//
//  QcEditViewController.h
//  160906_FriendList
//
//  Created by QChris on 16/9/15.
//  Copyright © 2016年 Chrisqc. All rights reserved.
//

#import "ViewController.h"
@class QcFriendList,QcEditViewController;

@protocol QcEditViewControllerDelegate <NSObject>
@optional
- (void)editViewControllerDelegate:(QcEditViewController *)editVc didSaveContace:(QcFriendList *)contact;

@end

@interface QcEditViewController :UIViewController

@property (nonatomic,strong ) QcFriendList *contact;

@property (nonatomic,weak) id <QcEditViewControllerDelegate> delegate;

@end
