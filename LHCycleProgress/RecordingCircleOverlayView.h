//
//  RecordingCircleOverlayView.h
//  BaseFrame
//
//  Created by nanfeng on 2017/3/28.
//  Copyright © 2017年 nanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordingCircleOverlayView : UIView

/** 环形进度条 进度*/
@property (nonatomic, assign) CGFloat progress;




/**
 <#Description#>

 @param frame       自身的frame
 @param strokeWidth 环形进度条填充宽度
 @param insets 环形进度条距边框边距
 @return <#return value description#>
 */
- (id)initWithFrame:(CGRect)frame strokeWidth:(CGFloat)strokeWidth insets:(UIEdgeInsets)insets;
@end
