//
//  CXNoteModel.m
//  remember
//
//  Created by Apple on 2017/7/22.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "CXNoteModel.h"

@implementation CXNoteModel

//设置为全局变量,避免频繁创建变量
static NSDateFormatter *fmt_;
static NSCalendar *calendar_;
//在第一次使用AHUTopic类时调用一次
+ (void)initialize
{
    fmt_ = [[NSDateFormatter alloc] init];
    calendar_ = [NSCalendar currentCalendar];
}

+ (instancetype)noteModelInitWithDic:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}
- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
//        self.diaryText = dic[@"diaryText"];
//        self.time = dic[@"time"];
//        self.imageUrl = dic[@"imageUrl"];
    }
    return self;
}

- (NSString *)time {
    //获得发帖日期
    fmt_.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *createdAtDate = [fmt_ dateFromString:_time];
    
    if (createdAtDate.isThisYear) {//今年
        if(createdAtDate.isToday){//今天
            //手机当前时间
            NSDate *nowDate = [NSDate date];
            NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            NSDateComponents *cmps = [calendar_ components:unit fromDate:createdAtDate toDate:nowDate options:0];
            
            if (cmps.hour >= 1){
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else {
                return @"刚刚";
            }
        } else if (createdAtDate.isYesterday) {//昨天
            fmt_.dateFormat = @"昨天 HH:mm";
            return [fmt_ stringFromDate:createdAtDate];
        } else { //其他
            fmt_.dateFormat = @"MM/dd HH:mm";
            return [fmt_ stringFromDate:createdAtDate];
            
        }
    } else {
        fmt_.dateFormat = @"yyyy/MM/dd HH:mm";
        return [fmt_ stringFromDate:createdAtDate];;
    }
}

@end
