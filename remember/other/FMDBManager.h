//
//  FMDBManager.h
//  remember
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface FMDBManager : NSObject


+ (FMDBManager *)sharedInstance;
- (void)createSqlite;
- (void)addDiaryWithText:(NSString *)diaryText imageUrl:(NSString *)imageUrl;
- (NSArray<NSDictionary *> *)getAllNotes;
@end
