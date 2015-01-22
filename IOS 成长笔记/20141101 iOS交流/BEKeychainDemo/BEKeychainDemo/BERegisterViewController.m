//
//  BERegisterViewController.m
//  BEKeychainDemo
//
//  Created by 张良 on 14-11-1.
//  Copyright (c) 2014年 张良. All rights reserved.
//

#import "BERegisterViewController.h"

@interface BERegisterViewController ()

@end

@implementation BERegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)TJAction:(id)sender {
    [BEKeyChain savePassWord:_password.text andUserId:_userID.text];
    [self performSegueWithIdentifier:@"zhucelogin" sender:self];
    
}
@end
