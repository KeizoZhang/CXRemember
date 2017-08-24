//
//  CXQuickFuncBox.m
//  remember
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "CXQuickFuncBox.h"

@implementation CXQuickFuncBox

+ (NSString *)dbString:(NSString *)string {
    if (string == nil || string.length == 0) {
        return @"";
    } else {
        return string;
    }
}

@end
