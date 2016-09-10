//
//  QcLoginViewController.m
//  160906_FriendList
//
//  Created by QChris on 16/9/10.
//  Copyright © 2016年 Chrisqc. All rights reserved.
//

#import "QcLoginViewController.h"
@interface QcLoginViewController()
@property (weak, nonatomic) IBOutlet UITextField *nameFile;
@property (weak, nonatomic) IBOutlet UITextField *pwdFile;
@property (weak, nonatomic) IBOutlet UIButton *lgBtn;
- (IBAction)rmbPwd;
- (IBAction)autoLogin;
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

- (IBAction)loginBtn;

@end

@implementation QcLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //监听通知 监听文字的变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameFile];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdFile];
}

//remove监听
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//监听 设定登录按钮的状态
- (void)textChange {
    self.lgBtn.enabled = (self.nameFile.text.length && self.pwdFile.text.length);
}

- (IBAction)rmbPwd {
    if (self.rmbPwdSwitch.isOn == NO) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)autoLogin {
    if (self.autoLoginSwitch.isOn) {
        [self.rmbPwdSwitch setOn:YES animated:YES];
    }
}

- (IBAction)loginBtn {
    
    if ([self.nameFile.text isEqualToString:@"aaa"]) {
        [self performSegueWithIdentifier:@"login2contacts" sender:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *contactVc = segue.destinationViewController;
    
    contactVc.title = [NSString stringWithFormat:@"%@的联系人列表", self.nameFile.text];
}
@end
