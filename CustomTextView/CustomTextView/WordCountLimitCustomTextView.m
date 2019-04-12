//
//  WordCountLimitCustomTextView.m
//  dsadasdasd
//
//  Created by 税鸽飞腾 on 2019/4/10.
//  Copyright © 2019 iCodeee. All rights reserved.
//

#import "WordCountLimitCustomTextView.h"
#import "UIColor+Hex.h"
#import <SDAutoLayout.h>
@interface WordCountLimitCustomTextView ()<UITextViewDelegate>
@property (nonatomic, strong) UILabel *placeHolderLable;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *wordCountLable;
@end
static const NSInteger WordCountLimit = 50;
@implementation WordCountLimitCustomTextView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self kSetUI];
       
    }
    return self;
}

- (void)kSetUI{
   
    //topView
//    UIView *topView
    
    //UITextView
    UITextView *textView = [[UITextView alloc]init];
    [self addSubview:textView];
    textView.backgroundColor = [UIColor whiteColor];
    textView.sd_layout
    .topSpaceToView(self, 12)
    .leftSpaceToView(self, 15)
    .bottomSpaceToView(self, 21)
    .rightSpaceToView(self, 15);
    textView.delegate = self;
    self.textView = textView;
    //placeHolder
    UILabel *placeHolderLable = [[UILabel alloc]init];
    [self addSubview:placeHolderLable];
    placeHolderLable.textColor = [UIColor colorWithHexString:@"#9F9F9F"];
    placeHolderLable.font = [UIFont systemFontOfSize:15];
    placeHolderLable.text = @"请输入内容..";
//    placeHolderLable.backgroundColor = [UIColor redColor];
    
    placeHolderLable.sd_layout
    .topSpaceToView(self, 16)
    .leftSpaceToView(self, 15)
    .rightSpaceToView(self, 15)
    .heightIs(20);
    self.placeHolderLable = placeHolderLable;
    
    //显示的分割线
    UIView *ViewLine = [[UIView alloc]init];
    [self addSubview:ViewLine];
    ViewLine.backgroundColor = [UIColor colorWithHexString:@"#DEDFE0"];
    ViewLine.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(1)
    .topSpaceToView(textView, 0);
    
    //bettomview
    UIView *bettomview = [[UIView alloc]init];
    [self addSubview:bettomview];
    bettomview.sd_layout
    .bottomEqualToView(self)
    .rightEqualToView(self)
    .heightIs(20)
    .leftEqualToView(self);
    bettomview.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    //显示的字数

    UILabel *wordCountLable = [[UILabel alloc]init];
    [bettomview addSubview:wordCountLable];
    wordCountLable.textColor = [UIColor colorWithHexString:@"#9F9F9F"];
    wordCountLable.font = [UIFont systemFontOfSize:15];
    wordCountLable.text = [NSString stringWithFormat:@"0/%ld",(long)WordCountLimit];
    wordCountLable.sd_layout
    .bottomEqualToView(bettomview)
    .rightSpaceToView(bettomview, 15)
    .topEqualToView(bettomview)
    .leftEqualToView(bettomview);
    wordCountLable.textAlignment = NSTextAlignmentRight;
    wordCountLable.backgroundColor = [UIColor clearColor];
    self.wordCountLable = wordCountLable;
}
/*****************UITextViewDelegate************************/
- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"**************%lu",textView.text.length);
    self.placeHolderLable.hidden = YES;
    //字数限制操作
    if (textView.text.length >= WordCountLimit) {
        textView.text = [textView.text substringToIndex:WordCountLimit];
        }
    //实时显示字数
    self.wordCountLable.text = [NSString stringWithFormat:@"%lu/%ld", (unsigned long)textView.text.length,(long)WordCountLimit];
    
//    self.text = self.textView.text;
    //文字为零 显示提示文字
    if (textView.text.length == 0){
        self.placeHolderLable.hidden = NO;
       }
    
}
- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.placeHolderLable.text = _placeholder;
}
- (NSString *)text{
    
    return self.textView.text;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
