//
//  QcContactViewController.m
//  160906_FriendList
//
//  Created by QChris on 16/9/10.
//  Copyright © 2016年 Chrisqc. All rights reserved.
//

#define ContactsFilepath []

#import "QcContactViewController.h"

@interface QcContactViewController ()
@property(nonatomic,strong) NSMutableArray *contancts;

@end

@implementation QcContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //再右边添加一个删除item
    UIBarButtonItem *addItem = self.navigationItem.rightBarButtonItem;
    UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteClick)];
    self.navigationItem.rightBarButtonItems = @[addItem,deleteItem];
}

- (void)deleteClick {
    
}

- (NSMutableArray *)contancts {
    if (_contancts == nil) {
        _contancts = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"contacts.data"]];
        if (_contancts == nil) {
            _contancts = [NSMutableArray array];
        }
    
    }
    return _contancts;
}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contancts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return cell;
}


@end
