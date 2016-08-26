//
//  DIYPickerView.h
//  time
//
//  Created by light on 16/6/15.
//  Copyright © 2016年 light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIYPickerView : UIView

@property (nonatomic, strong)   UIPickerView    *pickView;

@property (nonatomic, strong)   NSArray         *dataArray;

@property (nonatomic, strong)   UITextField     *textField;

- (id)initWithArray:(NSArray *)array;

+ (void)pickViewWithArray:(NSArray *)array forTextField:(UITextField *)textField;

- (void)show;

@end
