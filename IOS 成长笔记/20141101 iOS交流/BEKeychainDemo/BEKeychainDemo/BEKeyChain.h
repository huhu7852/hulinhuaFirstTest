//
//  BEKeyChain.h
//  GameShow
//
//  Created by 张良 on 14-8-6.
//  Copyright (c) 2014年 Coco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEKeyChain : NSObject

+ (void)delete:(NSString *)service ;
+(void)savePassWord:(NSString *)password andUserId:(NSString *)userid;
+(id)readUserId;
+(id)readPassWord;
+(void)deletePassWord;
@end
