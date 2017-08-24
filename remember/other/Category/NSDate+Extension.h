//
//  NSDate+Extension.h
//  remember
//
//  Created by Apple on 2017/7/24.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

//判断是否为今年
- (BOOL)isThisYear;
//判断是否为今天
- (BOOL)isToday;
//判断为昨天
- (BOOL)isYesterday;
//判断为明天
- (BOOL)isTomorrow;
@end
