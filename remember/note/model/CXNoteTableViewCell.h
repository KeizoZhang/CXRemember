//
//  CXNoteTableViewCell.h
//  remember
//
//  Created by Apple on 2017/5/20.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CXNoteModel;

@interface CXNoteTableViewCell : UITableViewCell

@property (nonatomic, strong) CXNoteModel *note;

@end