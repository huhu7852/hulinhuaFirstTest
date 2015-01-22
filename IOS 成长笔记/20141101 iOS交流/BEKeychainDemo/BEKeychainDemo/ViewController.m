//
//  ViewController.m
//  BEKeychainDemo
//
//  Created by 张良 on 14-10-31.
//  Copyright (c) 2014年 张良. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _userID.text = [BEKeyChain readUserId];
    _password.text = [BEKeyChain readPassWord];
    if(![_userID.text isEqualToString:nil] && ![_password.text isEqualToString:nil])
    {
        [self CheckPassword];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
   // [BEKeyChain savePassWord:_password.text andUserId:_userID.text];

    [self CheckPassword];
}

- (IBAction)registerAction:(id)sender {
    [self performSegueWithIdentifier:@"zhuce" sender:self];
}

-(void)CheckPassword
{
    NSLog(@"%@",[BEKeyChain readUserId]);
    if([_userID.text isEqualToString:[BEKeyChain readUserId]] &&[_password.text isEqualToString:[BEKeyChain readPassWord]])
    {
        [self performSegueWithIdentifier:@"denglu" sender:self];
    }else
    {
        NSLog(@"111111");
    }
}
@end
