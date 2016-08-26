//
//  ViewController.m
//  time
//
//  Created by light on 16/6/3.
//  Copyright © 2016年 light. All rights reserved.
//

#import "ViewController.h"
#import "DIYPickerView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *pickerViewTextfield;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@"123123",@"12314"];
    DIYPickerView * aaa=[[DIYPickerView alloc]initWithFrame:CGRectMake(0, 0, 400, 600)];
    [DIYPickerView pickViewWithArray:array forTextField:_pickerViewTextfield];
    [self.view addSubview:aaa];
    
//    /ssdfasdf
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
