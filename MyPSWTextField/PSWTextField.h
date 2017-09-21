//
//  PSWTextField.h
//  MyPSWTextField
//
//  Created by 石纯勇 on 16/9/9.
//  Copyright © 2016年 石纯勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSWTextField : UIView <UIKeyInput>


@property (nonatomic, strong) NSMutableString *text;

@property (nonatomic, assign) NSInteger length; /**<文字长度 密码6位>*/

@property (nonatomic, strong) UIColor *lineColor;/**<线的颜色 默认黑色>*/

@property (nonatomic, strong) UIColor *textColor;/**<密码颜色 默认黑色>*/
@end
