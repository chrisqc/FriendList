//
//  QcFriendList.m
//  160906_FriendList
//
//  Created by QChris on 16/9/6.
//  Copyright © 2016年 Chrisqc. All rights reserved.
//

#import "QcFriendList.h"

@implementation QcFriendList

- (void)encodeWithCoder:(NSCoder *)enCoder {
    [enCoder encodeObject:self.name forKey:@"name"];
    [enCoder encodeObject:self.phone forKey:@"phone"];
    
}

- (id)initWithCoder:(NSCoder *)deCoder {
    if (self = [super init]) {
        self.name = [deCoder decodeObjectForKey:@"name"];
        self.phone = [deCoder decodeObjectForKey:@"phone"];
    }
    return self;
}

@end
