//
//  ViewController.m
//  BaseFrame
//
//  Created by nanfeng on 2017/2/15.
//  Copyright © 2017年 nanfeng. All rights reserved.
//

#import "ViewController.h"
#import "RecordingCircleOverlayView.h"

@interface ViewController ()

@property(nonatomic,strong)RecordingCircleOverlayView *recordingCircleOverlayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    _recordingCircleOverlayView = [[RecordingCircleOverlayView alloc] initWithFrame:CGRectMake(100, 100, 100, 100) strokeWidth:10.f insets:UIEdgeInsetsMake(10.f, 0.f, 10.f, 0.f)];
    _recordingCircleOverlayView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    _recordingCircleOverlayView.duration = 10.f;
    [self.view addSubview:_recordingCircleOverlayView];
    
    
    UISlider * slider =[[UISlider alloc] initWithFrame:CGRectMake(50, 400, 300, 20)];
    [slider addTarget:self action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    _recordingCircleOverlayView.progress = 0.5;
#ifdef DEBUG//调试状态，打开LOG功能
    UIAlertView * alertView =[[UIAlertView alloc] initWithTitle:@"DEBUG" message:@"DEBUG" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertView show];
#else//发布状态，关闭LOG功能
    UIAlertView * alertView =[[UIAlertView alloc] initWithTitle:@"release" message:@"release" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertView show];
#endif

    
}
-(void)changeSlider:(UISlider*)slider
{
    _recordingCircleOverlayView.progress = slider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
