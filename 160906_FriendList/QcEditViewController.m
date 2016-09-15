//
//  QcEditViewController.m
//  160906_FriendList
//
//  Created by QChris on 16/9/15.
//  Copyright © 2016年 Chrisqc. All rights reserved.
//

#import "QcEditViewController.h"
#import "QcFriendList.h"

@interface QcEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

- (IBAction)save;
- (IBAction)edit:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;


@end

@implementation QcEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameField.text = self.contact.name;
    self.phoneField.text = self.contact.phone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textChange {
    
    self.saveBtn.enabled = (self.nameField.text.length && self.phoneField.text.length);
    
}

- (IBAction)save {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.delegate respondsToSelector:@selector(editViewControllerDelegate:didSaveContace:)]) {
        self.contact.name = self.nameField.text;
        self.contact.phone = self.phoneField.text;
        [self.delegate editViewControllerDelegate:self didSaveContace:self.contact];
    }
}

- (IBAction)edit:(UIBarButtonItem *)sender {
    if (self.nameField.enabled) {
        self.nameField.enabled = NO;
        self.phoneField.enabled = NO;
        [self.view endEditing:YES];
        self.saveBtn.hidden = YES;
        
        sender.title = @"编辑";
        self.nameField.text = self.contact.name;
        self.phoneField.text = self.contact.phone;
    }else {
        self.nameField.enabled = YES;
        self.phoneField.enabled = YES;
        [self.phoneField becomeFirstResponder];
        self.saveBtn.hidden = NO;
        
        sender.title = @"取消";
    }
}

@end
