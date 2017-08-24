//
//  UIView+Extension.m
//  remember
//
//  Created by Apple on 2017/7/10.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (CGSize)cx_size
{
    return self.frame.size;
}
- (void)setCx_size:(CGSize)cx_size
{
    CGRect frame = self.frame;
    frame.size = cx_size;
    self.frame = frame;
}

- (CGFloat)cx_width
{
    return self.frame.size.width;
}
- (void)setCx_width:(CGFloat)cx_width
{
    CGRect frame = self.frame;
    frame.size.width = cx_width;
    self.frame = frame;
}

- (CGFloat)cx_height
{
    return self.frame.size.height;
}
- (void)setCx_height:(CGFloat)cx_height
{
    CGRect frame = self.frame;
    frame.size.height = cx_height;
    self.frame = frame;
}

- (CGFloat)cx_x
{
    return self.frame.origin.x;
}
- (void)setCx_x:(CGFloat)cx_x
{
    CGRect frame = self.frame;
    frame.origin.x = cx_x;
    self.frame = frame;
}


- (CGFloat)cx_y
{
    return self.frame.origin.y;
}
- (void)setCx_y:(CGFloat)cx_y
{
    CGRect frame = self.frame;
    frame.origin.y = cx_y;
    self.frame = frame;
}

- (CGFloat)cx_centerX
{
    return self.center.x;
}
- (void)setCx_centerX:(CGFloat)cx_centerX
{
    CGPoint center = self.center;
    center.x = cx_centerX;
    self.center = center;
}


- (CGFloat)cx_centerY
{
    return self.center.y;
}
- (void)setCx_centerY:(CGFloat)cx_centerY
{
    CGPoint center = self.center;
    center.y = cx_centerY;
    self.center = center;
}



@end
