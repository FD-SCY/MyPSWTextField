//
//  ViewController.m
//  MyPSWTextField
//
//  Created by 石纯勇 on 16/9/9.
//  Copyright © 2016年 石纯勇. All rights reserved.
//

#import "ViewController.h"
#import "PSWTextField.h"

@interface ViewController ()
{
    PSWTextField *pswField;
    UILabel *valueLb;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    pswField = [[PSWTextField alloc]initWithFrame:CGRectMake(0, 20, 300, 300/8)];
    pswField.center = CGPointMake(self.view.center.x, 60);
    pswField.length = 8;
    [self.view addSubview:pswField];
    
    valueLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    valueLb.tag = 1000;
    valueLb.center = CGPointMake(self.view.center.x, 100);
    [self.view addSubview:valueLb];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    valueLb.text = pswField.text;
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
