//
//  DIYPickerView.m
//  time
//
//  Created by light on 16/6/15.
//  Copyright © 2016年 light. All rights reserved.
//

#import "DIYPickerView.h"

@interface DIYPickerView () <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIToolbar   *_toolBar;
    CGSize      _size;
}
@end
@implementation DIYPickerView

- (id)initWithArray:(NSArray *)array
{
    if (self = [super init]) {
        self.alpha = 0;
        self.dataArray = array;
        _size = [[UIScreen mainScreen] bounds].size;
        self.backgroundColor = [UIColor clearColor];
        [self addsubViews];
    } return self;
}

- (void)addsubViews
{
    self.frame = (CGRect){CGPointZero, _size};
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    
    _toolBar = [[UIToolbar alloc] init];
    _toolBar.tintColor = [UIColor grayColor];//kGrayColor(1.0);
    _toolBar.frame = (CGRect){0, _size.height, _size.width, 44};
    [self addSubview:_toolBar];
    
//    // 按钮自定义
////    UIBarButtonItem *item1 = [UIBarButtonItem barButtonItemWithTitle:@"取消" addTarget:self action:@selector(dismiss)];
//    UIButton *item1 = [[UIButton alloc]init];
//    item1.titleLabel.text = @"取消";
//    [item1 addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
////    UIBarButtonItem *item3 = [UIBarButtonItem barButtonItemWithTitle:@"确定" addTarget:self action:@selector(done)];
////    UIBarButtonItem *item3 = [UIBarButtonItem barButtonItemWithTitle:@"确定" addTarget:self action:@selector(done)];
//    UIButton *item3 = [[UIButton alloc]init];
//    item3.titleLabel.text = @"确定";
//    [item3 addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchUpInside];
//    _toolBar.items = [NSArray arrayWithObjects:item1, item2, item3, nil];
    
    self.pickView = [[UIPickerView alloc] init];
    self.pickView.showsSelectionIndicator = YES;
    self.pickView.backgroundColor = [UIColor grayColor];//kGrayColor(1.0);
    self.pickView.dataSource = self;
    self.pickView.delegate = self;
    self.pickView.frame = (CGRect){0, _size.height + 44, _size.width, 206 - 44};
    [self addSubview:self.pickView];
}

+ (void)pickViewWithArray:(NSArray *)array forTextField:(UITextField *)textField
{
    DIYPickerView *pickView = [[self alloc] initWithArray:array];
    pickView.textField = textField;
    [pickView show];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.dataArray[row];
}

- (void)show
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
        _toolBar.frame = (CGRect){0, _size.height - 206, _size.width, 44};
        self.pickView.frame = (CGRect){0, _size.height - 206 + 44, _size.width, 206 - 44};
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        _toolBar.frame = (CGRect){0, _size.height, _size.width, 44};
        self.pickView.frame = (CGRect){0, _size.height + 44, _size.width, 206 - 44};
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)done
{
    self.textField.text = [self.dataArray objectAtIndex:[self.pickView selectedRowInComponent:0]];
    [self dismiss];
}

@end
