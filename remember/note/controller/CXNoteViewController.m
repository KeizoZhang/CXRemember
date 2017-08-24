//
//  CXNoteViewController.m
//  remember
//
//  Created by Apple on 2017/6/25.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "CXNoteViewController.h"
#import "FMDBManager.h"

@interface CXNoteViewController ()
@property (nonatomic, strong) UITextView * textView;
@end

@implementation CXNoteViewController

- (instancetype)init {
    if (self = [super init]) {
        self.view.frame = CGRectMake(0, 0, CXKeyWindow.cx_width, CXKeyWindow.cx_height);
    }
    self.hidesBottomBarWhenPushed = YES;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];

}

- (void)setupViews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textView = [[UITextView alloc] init];
    [_textView setFont:[UIFont systemFontOfSize:19]];
    [self.view addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    self.navigationItem.title = @"新增笔记";
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [saveBtn sizeToFit];
    
    saveBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [saveBtn sizeToFit];
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:saveBtn];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}


- (void)saveBtnClick {
    
    if (self.textView.text.length == 0) {
        
    }
    
    [[FMDBManager sharedInstance] addDiaryWithText:self.textView.text imageUrl:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CXSaveNoteNotification object:nil];
}

@end
