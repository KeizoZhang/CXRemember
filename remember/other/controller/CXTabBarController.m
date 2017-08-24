//
//  CXTabBarController.m
//  remember
//
//  Created by Apple on 2017/5/20.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "CXTabBarController.h"
#import "CXNoteTableViewController.h"
#import "CXDateTableViewController.h"
#import "CXNavigationController.h"

@interface CXTabBarController ()

@end

@implementation CXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tabBar字体属性
    [self setTitleTextAttribute];
    //添加子控制器
    [self setChildViewControllers];
    
}


- (void)setTitleTextAttribute {
    UITabBarItem *tabBar = [UITabBarItem appearance];
    
    NSMutableDictionary *normalAttr = [NSMutableDictionary dictionary];
    normalAttr[NSFontAttributeName] = [UIFont systemFontOfSize:14.0];
    normalAttr[NSForegroundColorAttributeName] = [UIColor grayColor];
    [tabBar setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSFontAttributeName] = [UIFont systemFontOfSize:14.0];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [tabBar setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
}

- (void)setChildViewControllers {
    
    CXNavigationController *nav1 = [[CXNavigationController alloc] initWithRootViewController:[[CXNoteTableViewController alloc] init]];
    [self setOneChildViewController:nav1 image:@"tabBar_note_icon" selectedImage:@"tabBar_note_click_icon" title:@"笔记"];
    
    CXNavigationController *dateNav = [[CXNavigationController alloc] initWithRootViewController:[[CXDateTableViewController alloc] init]];
    [self setOneChildViewController:dateNav image:@"tabBar_time_icon" selectedImage:@"tabBar_time_click_icon" title:@"纪念日"];
}

- (void)setOneChildViewController:(UIViewController *)childVC image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title   {
    childVC.tabBarItem.title = title;
    
    if (image.length) {
        childVC.tabBarItem.image = [UIImage imageNamed:image];
        childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }

    [self addChildViewController:childVC];
}


@end
