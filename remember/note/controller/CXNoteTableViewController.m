//
//  CXNoteTableViewController.m
//  remember
//
//  Created by Apple on 2017/5/20.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "CXNoteTableViewController.h"
#import "CXNoteTableViewCell.h"
#import "CXNoteViewController.h"
#import "CXNoteModel.h"

@interface CXNoteTableViewController ()

@property (nonatomic, strong) NSArray<NSDictionary *> *noteArray;

@end

@implementation CXNoteTableViewController


static NSString * const noteCell = @"noteCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    
    [[FMDBManager sharedInstance] createSqlite];
    
    //注册cell
    [self.tableView registerClass:[CXNoteTableViewCell class] forCellReuseIdentifier:noteCell];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshViews) name:CXSaveNoteNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CXSaveNoteNotification object:nil];
}


- (void)setupViews {
    UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [publishBtn setTitle:@"新增" forState:UIControlStateNormal];
    [publishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [publishBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [publishBtn sizeToFit];
    
    publishBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [publishBtn sizeToFit];
    [publishBtn addTarget:self action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:publishBtn];
    self.navigationItem.title = @"笔记";
    
    
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSFontAttributeName] = [UIFont systemFontOfSize:18.0];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [self.navigationController.navigationBar setTitleTextAttributes:selectedAttr];
    
    self.noteArray = [[FMDBManager sharedInstance] getAllNotes];
}

- (void)refreshViews {
    self.noteArray = [[FMDBManager sharedInstance] getAllNotes];
    [self.tableView reloadData];
}

- (void)clickPublish {
    CXNoteViewController *noteVC = [[CXNoteViewController alloc] init];
    self.navigationController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:noteVC animated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.noteArray.count;
}


- (CXNoteTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CXNoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:noteCell forIndexPath:indexPath];
    cell.note = [CXNoteModel noteModelInitWithDic:self.noteArray[indexPath.row]];
    
    return cell;
}




@end













