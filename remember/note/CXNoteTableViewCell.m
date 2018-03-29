//
//  CXNoteTableViewCell.m
//  remember
//
//  Created by Keizo on 2017/9/7.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "CXNoteTableViewCell.h"
#import "CXNoteModel.h"

@interface CXNoteTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *diaryLabel;


@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end


@implementation CXNoteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.diaryLabel.frame = CGRectMake(0, 0, self.window.cx_width, 30);
    self.diaryLabel.textColor = [UIColor redColor];
    self.timeLabel.frame = CGRectMake(0, 30, self.window.cx_height, 30);
    [self addSubview:self.timeLabel];
    [self addSubview:self.diaryLabel];
}

- (void)setNote:(CXNoteModel *)note {
    _note = note;
    
    self.diaryLabel.text = note.diaryText;
    
    self.timeLabel.text = note.time;
    
}



@end
