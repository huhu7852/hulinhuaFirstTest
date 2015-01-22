//
//  ViewController.h
//  BEKeychainDemo
//
//  Created by 张良 on 14-10-31.
//  Copyright (c) 2014年 张良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEKeyChain.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)loginAction:(id)sender;

- (IBAction)registerAction:(id)sender;
@end

