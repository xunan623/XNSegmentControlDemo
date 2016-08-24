//
//  ViewController.m
//  XNSegmentControlDemo
//
//  Created by xunan on 16/8/24.
//  Copyright © 2016年 xunan. All rights reserved.
//

#import "ViewController.h"
#import "XNSegmentControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    XNSegmentControl *segment = [[XNSegmentControl alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
    segment.backgroundColor = [UIColor grayColor];
    segment.titlesArray = @[@"选项1",@"选项2"];
    segment.selectedIndex = 0;
    [self.view addSubview:segment];
}

@end
