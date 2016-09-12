//
//  QcContactCellTableViewCell.h
//  160906_FriendList
//
//  Created by Chris on 16-9-12.
//  Copyright (c) 2016年 Chrisqc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QcFriendList;

@interface QcContactCellTableViewCell : UITableViewCell

@property (nonatomic,strong) QcFriendList *friendList;

+ (instancetype)cellWithTableView:(UITableView *)tableview;

@end
