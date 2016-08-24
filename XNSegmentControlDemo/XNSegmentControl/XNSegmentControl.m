//
//  XNSegmentControl.m
//  XNSegmentControlDemo
//
//  Created by xunan on 16/8/24.
//  Copyright © 2016年 xunan. All rights reserved.
//

#import "XNSegmentControl.h"

static NSUInteger const XNSegmentControlTag = 100;

@interface XNSegmentControl()

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *driftView;




@end

@implementation XNSegmentControl

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.cornerRadius = 9.0f;
        self.layer.masksToBounds = YES;
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 9.0f;
        self.layer.masksToBounds = YES;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.driftView];
    [self addSubview:self.leftView];
    [self addSubview:self.rightView];
}

#pragma mark - Setter & Getter

- (void)setTitlesArray:(NSArray *)titlesArray {
    _titlesArray = titlesArray;
    [self.leftButton setTitle:titlesArray[0] forState:UIControlStateNormal];
    [self.leftView addSubview:self.leftButton];
    [self.rightButton setTitle:titlesArray[1] forState:UIControlStateNormal];
    [self.rightView addSubview:self.rightButton];
}

- (void)setDriftViewTranslate:(CGFloat)driftViewTranslate {
    _driftViewTranslate = driftViewTranslate;
    if (driftViewTranslate < 0) driftViewTranslate = 0;
    if (driftViewTranslate > self.frame.size.width) driftViewTranslate = self.frame.size.width;
    self.driftView.frame = CGRectMake(driftViewTranslate, self.driftView.frame.origin.y, self.driftView.frame.size.width, self.driftView.frame.size.height);
}

- (UIView *)rightView {
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
        _rightView.frame = CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height);
        _rightView.backgroundColor = [UIColor clearColor];
    }
    return _rightView;
}

- (UIView *)leftView {
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
        _leftView.frame = CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height);
        _leftView.backgroundColor = [UIColor clearColor];
    }
    return _leftView;
}
- (UIView *)driftView {
    if (!_driftView) {
        _driftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height)];
        _driftView.backgroundColor = [UIColor whiteColor];
    }
    return _driftView;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = _leftView.bounds;
        _leftButton.tag = XNSegmentControlTag;
        [_leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = _rightView.bounds;
        _rightButton.tag = XNSegmentControlTag + 1;
        [_rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    return _rightButton;
}

#pragma mark Action
- (void)buttonClick:(UIButton *)btn {
    NSUInteger tag = btn.tag - XNSegmentControlTag;
    if (tag == self.selectedIndex) return;
    [self setSelectedIndex:tag];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    self.userInteractionEnabled = NO;
    if (selectedIndex) {
        [UIView animateWithDuration:0.3 animations:^{
            self.driftView.frame = CGRectMake(self.frame.size.width/2, self.driftView.frame.origin.y, self.driftView.frame.size.width, self.driftView.frame.size.height);
        } completion:^(BOOL finished) {
            [_leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            self.userInteractionEnabled = YES;
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.driftView.frame = CGRectMake(0, self.driftView.frame.origin.y, self.driftView.frame.size.width, self.driftView.frame.size.height);
        } completion:^(BOOL finished) {
            [_leftButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            self.userInteractionEnabled = YES;
        }];
    }
}


































@end
