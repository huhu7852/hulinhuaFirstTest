//
//  BERegisterViewController.h
//  BEKeychainDemo
//
//  Created by 张良 on 14-11-1.
//  Copyright (c) 2014年 张良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEKeyChain.h"
#import "BELoginSucessViewViewController.h"

@interface BERegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)TJAction:(id)sender;

@end
