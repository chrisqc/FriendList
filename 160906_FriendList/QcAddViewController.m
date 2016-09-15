//
//  QcAddViewController.m
//  160906_FriendList
//
//  Created by QChris on 16/9/15.
//  Copyright © 2016年 Chrisqc. All rights reserved.
//

#import "QcAddViewController.h"
#import "QcFriendList.h"

@interface QcAddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *PhoneField;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

- (IBAction)submitClick;

@end

@implementation QcAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textField) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textField) name:UITextFieldTextDidChangeNotification object:self.PhoneField];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textField {
    self.submitBtn.enabled = (self.nameField.text.length && self.PhoneField.text.length);
}

- (IBAction)submitClick {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.delegate respondsToSelector:@selector(addViewController:didAddContact:)]) {
        QcFriendList *contact = [[QcFriendList alloc] init];
        contact.name = self.nameField.text;
        contact.phone = self.PhoneField.text;
        
        NSLog(@"%@",contact.name);
        [self.delegate addViewController:self didAddContact:contact];
        
    }
}
@end
