//
//  NSString+Verify.h
//  Owner
//
//  Created by Wdy on 2017/8/4.
//  Copyright © 2017年 Wdy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verify)

#pragma mark - 输入限制
// 验证只能输入数字，两位小数
+ (BOOL)isOnlyNumAndTwoDecimal:(NSString *)tfText range:(NSRange)range string:(NSString *)string;
// 判断是不是纯数字
- (BOOL)isAllNum;
// 判断是否为整形
- (BOOL)isPureInt;
// 判断是否为浮点形
- (BOOL)isPureFloat;
// 限制只能输入数字
- (BOOL) isOnlyNumber;

// 有效的电话号码
- (BOOL) isValidMobileNumber;
// 有效的银行卡号
- (BOOL) isValidBankCardNumber;
// 有效的邮箱
- (BOOL) isValidEmail;
// 有效的字母数字密码
- (BOOL) isValidAlphaNumberPassword;

// 检测有效身份证
// 15位
- (BOOL) isValidIdentifyFifteen;
// 18位
- (BOOL) isValidIdentifyEighteen;

#pragma mark - 判断字符串
// 判断是不是长度为0空的
- (BOOL)isNil;

@end
