//
//  XNSegmentControl.h
//  XNSegmentControlDemo
//
//  Created by xunan on 16/8/24.
//  Copyright © 2016年 xunan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XNSegmentControl : UIView

/** 标题 */
@property (strong, nonatomic) NSArray *titlesArray;
/** 滑块偏移量 */
@property (nonatomic, assign) CGFloat driftViewTranslate;
/** 当前选中的按钮 */
@property (nonatomic, assign) NSUInteger selectedIndex;

@end
