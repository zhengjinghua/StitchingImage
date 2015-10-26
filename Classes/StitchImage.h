//
//  StitchImage.h
//  StitchingImage
//
//  Created by Jin on 10/9/15.
//  Copyright © 2015 Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StitchImage : UIImageView

- (UIImageView *)stitchingOnImageView:(UIImageView *)canvasView withImageViews:(NSArray *)imageViews;
- (UIImageView *)stitchingOnImageView:(UIImageView *)canvasView withImageViews:(NSArray *)imageViews marginValue:(CGFloat)marginValue;

@end
