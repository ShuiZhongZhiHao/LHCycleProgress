//
//  RecordingCircleOverlayView.m
//  SparkRecordingCircle
//
//  Created by Sam Page on 1/02/14.
//  Copyright (c) 2014 Sam Page. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
#import "RecordingCircleOverlayView.h"

@interface RecordingCircleOverlayView ()

@property (nonatomic, strong) UIBezierPath *circlePath;

@property (nonatomic, strong) CAShapeLayer *currentProgressLayer;
@property (nonatomic, strong) CAShapeLayer *backgroundLayer;

@property (nonatomic, assign) CGFloat strokeWidth;
@property (nonatomic, assign, getter = isCircleComplete) BOOL circleComplete;
@property (nonatomic, assign) CGPoint arcCenter;
@property (nonatomic, assign)CGFloat radius;

@end

@implementation RecordingCircleOverlayView

- (id)initWithFrame:(CGRect)frame strokeWidth:(CGFloat)strokeWidth insets:(UIEdgeInsets)insets
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor =[UIColor whiteColor];
        self.strokeWidth = strokeWidth;
        
        self.arcCenter = CGPointMake(CGRectGetMidY(self.bounds), CGRectGetMidX(self.bounds));
        
        self.radius = CGRectGetMidX(self.bounds) - insets.top - insets.bottom;
        [self addBackgroundLayer];

      }
    return self;
}
-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.circlePath = [UIBezierPath bezierPathWithArcCenter:self.arcCenter
                                                     radius:self.radius
                                                 startAngle:                                            DEGREES_TO_RADIANS(-90)
                                                   endAngle:DEGREES_TO_RADIANS((360*_progress-90))
                                                  clockwise:YES];
    
    self.backgroundLayer.path = self.circlePath.CGPath;


    
}
- (void)addBackgroundLayer
{
    self.backgroundLayer = [CAShapeLayer layer];
   // self.backgroundLayer.path = self.circlePath.CGPath;
    self.backgroundLayer.strokeColor = [[UIColor redColor] CGColor];
    self.backgroundLayer.fillColor = [[UIColor clearColor] CGColor];
    self.backgroundLayer.lineWidth = self.strokeWidth;
    
    [self.layer addSublayer:self.backgroundLayer];
    
    CAGradientLayer *  colorLayer = [CAGradientLayer layer];
    colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    colorLayer.frame    = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    colorLayer.backgroundColor = [UIColor whiteColor].CGColor;
    //    colorLayer.position = self.center;
    
    [self.layer addSublayer:colorLayer];
    colorLayer.mask = self.backgroundLayer;
    // 颜色分配
    colorLayer.colors = @[(__bridge id)UIColorFromRGB(0xf83c33).CGColor,
                          (__bridge id)UIColorFromRGB(0xfcba64).CGColor];
    colorLayer.locations  = @[@(0.25), @(0.85)];
    // 起始点
    colorLayer.startPoint = CGPointMake(0, 0);
    // 结束点
    colorLayer.endPoint   = CGPointMake(1, 0);
}
-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];

    

//        // 放大
//        self.circlePath = [UIBezierPath bezierPathWithArcCenter:self.arcCenter
//                                                         radius:self.radius
//                                                     startAngle:                                            DEGREES_TO_RADIANS(-90)
//                                                       endAngle:DEGREES_TO_RADIANS((360*_progress-90))
//                                                      clockwise:YES];
//        self.backgroundLayer.path = self.circlePath.CGPath;
    


}
- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.f];
}

@end
