//
//  NSString+Verify.m
//  Owner
//
//  Created by Wdy on 2017/8/4.
//  Copyright © 2017年 Wdy. All rights reserved.
//

#import "NSString+Verify.h"

@implementation NSString (Verify)

// 验证只能输入数字，两位小数
+ (BOOL)isOnlyNumAndTwoDecimal:(NSString *)tfText range:(NSRange)range string:(NSString *)string {
    //    限制只能输入数字
    BOOL isHaveDian = YES;
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    
    if ([tfText rangeOfString:@"."].location == NSNotFound) {
        isHaveDian = NO;
    }
    if ([string length] > 0) {
        
        unichar single = [string characterAtIndex:0];//当前输入的字符
        if ((single >= '0' && single <= '9') || single == '.') {//数据格式正确
            
            if([tfText length] == 0){
                if(single == '.') {
                    kCENTER_STRING(@"数据格式有误");
                    [tfText stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            
            //输入的字符是否是小数点
            if (single == '.') {
                if(!isHaveDian)//text中还没有小数点
                {
                    isHaveDian = YES;
                    return YES;
                    
                }else{
                    kCENTER_STRING(@"数据格式有误");
                    [tfText stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }else{
                if (isHaveDian) {//存在小数点
                    
                    //判断小数点的位数
                    NSRange ran = [tfText rangeOfString:@"."];
                    if (range.location - ran.location <= 2) {
                        return YES;
                    }else{
                        kCENTER_STRING(@"最多两位小数");
                        return NO;
                    }
                }else{
                    return YES;
                }
            }
        }else{//输入的数据格式不正确
            kCENTER_STRING(@"数据格式有误");
            [tfText stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    else
    {
        return YES;
    }
}

// 判断是不是全数字
- (BOOL)isAllNum {
    NSString *temStr = self;
    temStr = [temStr stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(temStr.length > 0) {
        return NO;
    }
    return YES;
}

// 判断是否为整形：
- (BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

// 判断是否为浮点形：
- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

#pragma mark - 正则表达式匹配
#pragma mark - 正则相关
// 验证手机号
- (BOOL) isValidMobileNumber {
    NSString* const MOBILE = @"^1(3|4|5|7|8)\\d{9}$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [predicate evaluateWithObject:self];
}

// 有效银行卡号
- (BOOL) isValidBankCardNumber {
    NSString* const BANKCARD = @"^(\\d{16}|\\d{19})$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", BANKCARD];
    return [predicate evaluateWithObject:self];
}

// 有效邮箱
- (BOOL) isValidEmail
{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
    
}

// 6到12位数字字母密码
- (BOOL) isValidAlphaNumberPassword
{
    NSString *regex = @"^(?!\\d+$|[a-zA-Z]+$)\\w{6,12}$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [identityCardPredicate evaluateWithObject:self];
}

// 15位身份证号
- (BOOL) isValidIdentifyFifteen
{
    NSString * identifyTest=@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}

// 18位身份证号
- (BOOL) isValidIdentifyEighteen
{
    NSString * identifyTest=@"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}

// 验证是不是只能输入数字
- (BOOL) isOnlyNumber
{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < self.length) {
        NSString * string = [self substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    
    return res;
}

#pragma mark - 判断字符串
// 判断是不是长度为0空的
- (BOOL)isNil {
    if (self.length == 0 || self == nil) {
        return YES;
    } else {
        return NO;
    }
}



@end
