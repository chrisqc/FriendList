//
//  QcContactViewController.m
//  160906_FriendList
//
//  Created by QChris on 16/9/10.
//  Copyright © 2016年 Chrisqc. All rights reserved.
//



#import "QcContactViewController.h"
#import "QcContactCellTableViewCell.h"
#import "QcAddViewController.h"

#define ContactsFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"contacts.data"]

@interface QcContactViewController () <QcAddViewControllerDelegate>
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
        _contancts = [NSKeyedUnarchiver unarchiveObjectWithFile:ContactsFilepath];
        if (_contancts == nil) {
            _contancts = [NSMutableArray array];
        }
    
    }
    return _contancts;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id vc = segue.destinationViewController;
    
    QcAddViewController *addVc = vc;
    addVc.delegate =self;
}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contancts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QcContactCellTableViewCell *cell = [QcContactCellTableViewCell cellWithTableView:tableView];
    
    cell.friendList = self.contancts [indexPath.row];
    
    return cell;
}

#pragma mark - 实现addview代理方法
- (void)addViewController:(QcAddViewController *)addVc didAddContact:(QcFriendList *)contact {
    
    [self.contancts addObject:contact];
    
    NSLog(@"%@",self.contancts);
    
    [self.tableView reloadData];
    
    [NSKeyedArchiver archiveRootObject:self.contancts toFile:ContactsFilepath];
}


@end
