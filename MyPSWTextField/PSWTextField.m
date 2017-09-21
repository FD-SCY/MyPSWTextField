//
//  PSWTextField.m
//  MyPSWTextField
//
//  Created by 石纯勇 on 16/9/9.
//  Copyright © 2016年 石纯勇. All rights reserved.
//

#import "PSWTextField.h"

@implementation PSWTextField

#pragma mark - UIKeyInput
- (BOOL)hasText {
    if (_text.length > 0) {
        return YES;
    }
    return NO;
}

- (void)insertText:(NSString *)text {
    if (!_text) {
        _text = [NSMutableString string];
    }
    if (_text.length >= _length) {
        return;
    }
    else if (text == nil || [text isEqualToString:@""]) {
        return;
    }
    [_text appendString:text];
    
    [self setNeedsDisplay];
}

- (void)deleteBackward {

    if (!_text || _text.length == 0) {
        return;
    }
    
    [_text deleteCharactersInRange:NSMakeRange(_text.length-1, 1)];
    [self setNeedsDisplay];
}

- (UIKeyboardType)keyboardType {
    return UIKeyboardTypeNumberPad;
}
/////////////////////////
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self isFirstResponder]) {
        [self becomeFirstResponder];
    }
}


- (void)loadDefaultTheme {
    _lineColor = [UIColor lightGrayColor];
    _textColor = [UIColor blackColor];
    self.layer.cornerRadius = 5;
    self.layer.borderColor = _lineColor.CGColor;
    self.layer.borderWidth = 1;
    _length = 6;
}
#pragma mark - init
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self loadDefaultTheme];
    }
    return self;
}
- (id)init {
    if (self = [super init]) {
        [self loadDefaultTheme];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self loadDefaultTheme];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat height = rect.size.height;
    CGFloat width = rect.size.width;
    CGFloat cellWidth = width/self.length;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 1.0);
    //画矩形框 使内部颜色为白色
    CGContextAddRect(context, CGRectMake(0, 0, width, height));
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    // 画竖线
    for (NSInteger length=1; length<_length; length++) {
        
        CGContextMoveToPoint(context, cellWidth*length, 0);
        CGContextAddLineToPoint(context, cellWidth*length, height);
        CGContextClosePath(context);
    }
    
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextSetFillColorWithColor(context, _textColor.CGColor);
    for (int num=1; num<=_text.length; num++) {
        CGContextAddArc(context, cellWidth*(num*2-1)/2, height/2.0, cellWidth*0.2, 0, M_PI*2, YES);
        CGContextDrawPath(context, kCGPathFill);
    }
    
    CGContextStrokePath(context);
    CGContextClosePath(context);
}

@end
