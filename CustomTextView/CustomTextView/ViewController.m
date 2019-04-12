//
//  ViewController.m
//  CustomTextView
//
//  Created by 税鸽飞腾 on 2019/4/12.
//  Copyright © 2019 iCodeee. All rights reserved.
//

#import "ViewController.h"
#import "WordCountLimitCustomTextView.h"
#import <SDAutoLayout.h>
#import "UIColor+Hex.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    
    WordCountLimitCustomTextView *View = [[WordCountLimitCustomTextView alloc]init];
    [self.view addSubview:View];
    View.placeholder = @"我是placeHolder";
    View.sd_layout
    .topSpaceToView(self.view, 100)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(200);
    
}


@end
