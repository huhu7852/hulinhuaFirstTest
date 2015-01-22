//
//  BEKeyChain.m
//  GameShow
//
//  Created by 张良 on 14-8-6.
//  Copyright (c) 2014年 Coco. All rights reserved.
//

#import "BEKeyChain.h"

@implementation BEKeyChain

static NSString * const KEY_IN_KEYCHAIN = @"com.zhangliang.app.allinfo";
static NSString * const KEY_PASSWORD = @"com.zhangliang.app.password";
static NSString * const KEY_USERID = @"com.zhangliang.app.zhanghao";



+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            service, (__bridge_transfer id)kSecAttrService,
            service, (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    return ret;
}

+ (void)delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}


//保存用户名和密码
+(void)savePassWord:(NSString *)password andUserId:(NSString *)userid
{
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:userid forKey:KEY_USERID];
    [usernamepasswordKVPairs setObject:password forKey:KEY_PASSWORD];
    [BEKeyChain save:KEY_IN_KEYCHAIN data:usernamepasswordKVPairs];
    
 
}
+(id)readUserId
{
    //取出存贮在keychain中的用户名
    NSMutableDictionary *usernamepasswordKVPairs = (NSMutableDictionary *)[BEKeyChain load:KEY_IN_KEYCHAIN];
    return [usernamepasswordKVPairs objectForKey:KEY_USERID];
}

+(id)readPassWord
{
    //读取密码
    NSMutableDictionary *usernamepasswordKVPairs = (NSMutableDictionary *)[BEKeyChain load:KEY_IN_KEYCHAIN];
    return [usernamepasswordKVPairs objectForKey:KEY_PASSWORD];
}
//删除用户名和密码
+(void)deletePassWord
{
    [BEKeyChain delete:KEY_IN_KEYCHAIN];
}

@end
