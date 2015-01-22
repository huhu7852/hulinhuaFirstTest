//
//  BELoginSucessViewViewController.m
//  BEKeychainDemo
//
//  Created by 张良 on 14-11-1.
//  Copyright (c) 2014年 张良. All rights reserved.
//

#import "BELoginSucessViewViewController.h"

@interface BELoginSucessViewViewController ()

@end

@implementation BELoginSucessViewViewController

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

- (IBAction)loginOUt:(id)sender {
    [BEKeyChain deletePassWord];
    [self performSegueWithIdentifier:@"tuichu" sender:self];
}
@end
