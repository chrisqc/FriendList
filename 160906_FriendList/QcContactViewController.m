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
#import "QcEditViewController.h"
#import "QcFriendList.h"

#define ContactsFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"contacts.data"]

@interface QcContactViewController () <QcAddViewControllerDelegate,QcEditViewControllerDelegate>
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
    
    if ([vc isKindOfClass:[QcAddViewController class]]) {
        QcAddViewController *addVc = vc;
        addVc.delegate =self;
    }else if ([vc isKindOfClass:[QcEditViewController class]]) {
        QcEditViewController *editVc = vc;
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        editVc.contact = self.contancts[path.row];
        editVc.delegate = self;
    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contancts removeObjectAtIndex:indexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
        [NSKeyedArchiver archiveRootObject:self.contancts toFile:ContactsFilepath];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        QcFriendList *contact = [[QcFriendList alloc] init];
        contact.name = @"jack";
        contact.phone = @"10086";
        [self.contancts insertObject:contact atIndex:indexPath.row +1];
        
        NSIndexPath *nextPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[nextPath] withRowAnimation:UITableViewRowAnimationBottom];
        [NSKeyedArchiver archiveRootObject:self.contancts toFile:ContactsFilepath];
    }
}

- (void)deleteClick {
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row%2 ? UITableViewCellEditingStyleDelete:UITableViewCellEditingStyleInsert;
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

#pragma mark - 实现editView方法
- (void)editViewControllerDelegate:(QcEditViewController *)editVc didSaveContace:(QcFriendList *)contact {
    [self.tableView reloadData];
    
    [NSKeyedArchiver archiveRootObject:self.contancts toFile:ContactsFilepath];
}


@end
