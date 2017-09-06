//
//  FMDBManager.m
//  remember
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "FMDBManager.h"

#define UserSqlitePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"user.sqlite"]

@interface FMDBManager()
@property (nonatomic, strong) FMDatabaseQueue *dbQueue;
@end


@implementation FMDBManager

+ (FMDBManager *)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[FMDBManager alloc] init];
    });
    return sharedInstance;
}

- (FMDatabaseQueue *)dbQueue {
    if (nil == _dbQueue) {
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:UserSqlitePath];
    }
    return _dbQueue;
}

- (void)createSqlite {
    //创建数据库
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        
        NSString *createStr = @"CREATE TABLE IF NOT EXISTS diary (id integer, diaryText text, imageUrl text, time text NOT NULL);";
        BOOL result = [db executeUpdate:createStr];
        if (result) {
            CXLog(@"建表成功");
        }
        else {
            CXLog(@"建表失败");
            [_dbQueue close];
        }
    }];
}

- (void)addDiaryWithText:(NSString *)diaryText imageUrl:(NSString *)imageUrl {

    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:[NSDate date]];

    [self.dbQueue inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"INSERT INTO diary (diaryText, imageUrl, time) VALUES(?, ?, ?);", [CXQuickFuncBox dbString:diaryText], [CXQuickFuncBox dbString:imageUrl], [CXQuickFuncBox dbString:dateStr]];
        if (result) {
            CXLog(@"存储成功");
        }
        else {
            CXLog(@"存储失败");
        }
    }];
}

- (void)updateDiaryWithOldTime:(NSString *)oldTime newText:(NSString *)newDiaryText newImageUrl:(NSString *)newImageUrl {
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"UPDATE diary SET diaryText = ?, time = ?, imageUrl = ? WHERE time = ?;", [CXQuickFuncBox dbString:newDiaryText], [CXQuickFuncBox dbString:dateStr], [CXQuickFuncBox dbString:newImageUrl], [CXQuickFuncBox dbString:oldTime]];
        if (result) {
            CXLog(@"更新成功");
        } else {
            CXLog(@"更新失败");
        }
    }];
}

- (void)deleteDiaryWithTime:(NSString *)timeStr {
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"DELETE FROM diary WHERE time = ?;", timeStr];
        if (result) {
            CXLog(@"删除成功");
        } else {
            CXLog(@"删除失败");
        }
    }];
    
}

- (NSArray<NSDictionary *> *)getAllNotes {
    __block NSMutableArray<NSDictionary *> *array = [[NSMutableArray alloc] init];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM diary;"];
        while ([result next]) {
            NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
            [dictionary setObject:[CXQuickFuncBox dbString:[result objectForColumnName:@"diaryText"]] forKey:@"diaryText"];
            [dictionary setObject:[CXQuickFuncBox dbString:[result objectForColumnName:@"imageUrl"]] forKey:@"imageUrl"];
            [dictionary setObject:[CXQuickFuncBox dbString:[result objectForColumnName:@"time"]] forKey:@"time"];
            [array addObject:dictionary];
        }
        [result close];
    }];
    return array;
}



@end


















