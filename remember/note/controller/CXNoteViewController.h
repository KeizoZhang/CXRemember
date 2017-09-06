//
//  CXNoteViewController.h
//  remember
//
//  Created by Apple on 2017/6/25.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXNoteViewController : UIViewController

@property (nonatomic, strong) UITextView * textView;
@property (nonatomic, copy) NSString * timeStr;
@property (nonatomic, assign) BOOL needUpdate;

@end
