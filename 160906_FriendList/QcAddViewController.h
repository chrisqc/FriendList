//
//  QcAddViewController.h
//  160906_FriendList
//
//  Created by QChris on 16/9/15.
//  Copyright © 2016年 Chrisqc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QcAddViewController,QcFriendList;

@protocol QcAddViewControllerDelegate <NSObject>

@optional

- (void)addViewController:(QcAddViewController *)addVc didAddContact:(QcFriendList *)contact;

@end

@interface QcAddViewController : UIViewController

@property (nonatomic,weak) id <QcAddViewControllerDelegate> delegate;

@end
