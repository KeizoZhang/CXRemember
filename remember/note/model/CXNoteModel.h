//
//  CXNoteModel.h
//  remember
//
//  Created by Apple on 2017/7/22.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXNoteModel : NSObject

@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *diaryText;
@property (nonatomic, assign) NSInteger noteId;


+ (instancetype)noteModelInitWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
