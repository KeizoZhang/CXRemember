//
//  CXNoteTableViewCell.m
//  remember
//
//  Created by Apple on 2017/5/20.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "CXNoteTableViewCell.h"
#import "CXNoteModel.h"

@interface CXNoteTableViewCell ()

@end

@implementation CXNoteTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    
    return self;
}


- (void)setNote:(CXNoteModel *)note {
    _note = note;
    
    self.textLabel.text = note.diaryText;
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = note.time;
    
    [self addSubview:timeLabel];
    CGFloat width = [timeLabel.text sizeWithAttributes:@{NSFontAttributeName:timeLabel.font}].width;

    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
        make.width.mas_equalTo(width);
    }];
}

@end
