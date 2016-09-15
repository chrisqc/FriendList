//
//  QcContactCellTableViewCell.m
//  160906_FriendList
//
//  Created by Chris on 16-9-12.
//  Copyright (c) 2016年 Chrisqc. All rights reserved.
//

#import "QcContactCellTableViewCell.h"
#import "QcFriendList.h"

@implementation QcContactCellTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableview {
    
    static NSString *ID = @"contact";
    
    return [tableview dequeueReusableCellWithIdentifier:ID];
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}


- (void)setFriendList:(QcFriendList *)friendList {
    _friendList = friendList;
    
    self.textLabel.text = _friendList.name;
    self.detailTextLabel.text = _friendList.phone;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
