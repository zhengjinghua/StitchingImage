//
//  StitchImage.m
//  StitchingImage
//
//  Created by Jin on 10/9/15.
//  Copyright © 2015 Jin. All rights reserved.
//

#import "StitchingImage.h"

const CGFloat marginSpaceRatio = 27.0;

@interface StitchingImage ()
{
   CGFloat _cellImageViewchrSideLength;
   CGFloat _margin;
}
@end

@implementation StitchingImage

- (UIImageView *)stitchingOnImageView:(UIImageView *)canvasView withImageViews:(NSArray *)imageViews {
    _margin = canvasView.frame.size.width / marginSpaceRatio;
    return [self stitchingOnImageView:canvasView withImageViews:imageViews marginValue:_margin];
}

- (UIImageView *)stitchingOnImageView:(UIImageView *)canvasView withImageViews:(NSArray *)imageViews marginValue:(CGFloat)_marginValue {
    _margin = _marginValue;
    [self generateImageViewSideLengthWithCanvasView:canvasView byImageViewsCount:imageViews.count];
    
    if ([imageViews count] == 1)
    {
        UIImageView* imageView_1 = imageViews[0];
        imageView_1.frame = CGRectMake(0, 0, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
    }
    else if ([imageViews count] == 2)
    {
        CGFloat row_1_origin_y = (canvasView.frame.size.height - _cellImageViewchrSideLength) / 2;
        imageViews = [self generatorMatrix:imageViews beginOriginY:row_1_origin_y];
    }
    else if ([imageViews count] == 3)
    {
        CGFloat row_1_origin_y = (canvasView.frame.size.height - _cellImageViewchrSideLength * 2) / 3;

        UIImageView* imageView_1 = imageViews[0];
        imageView_1.frame = CGRectMake((canvasView.frame.size.width - _cellImageViewchrSideLength) / 2, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
        
        imageViews = [self generatorMatrix:imageViews beginOriginY:row_1_origin_y + _cellImageViewchrSideLength + _margin];
    }
    else if ([imageViews count] == 4)
    {
        CGFloat row_1_origin_y = (canvasView.frame.size.height - _cellImageViewchrSideLength * 2) / 3;
        imageViews = [self generatorMatrix:imageViews beginOriginY:row_1_origin_y];
    }
    else if ([imageViews count] == 5)
    {
        CGFloat row_1_origin_y = (canvasView.frame.size.height - _cellImageViewchrSideLength * 2 - _margin) / 2;
        
        UIImageView* imageView_1 = imageViews[0];
        imageView_1.frame = CGRectMake((canvasView.frame.size.width - 2 * _cellImageViewchrSideLength - _margin) / 2, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
        
        UIImageView* imageView_2 = imageViews[1];
        imageView_2.frame = CGRectMake(imageView_1.frame.origin.x + imageView_1.frame.size.width + _margin, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
        
        imageViews = [self generatorMatrix:imageViews beginOriginY:row_1_origin_y + _cellImageViewchrSideLength + _margin];
    }
    else if ([imageViews count] == 6)
    {
        CGFloat row_1_origin_y = (canvasView.frame.size.height - _cellImageViewchrSideLength * 2 - _margin) / 2;
        
        imageViews = [self generatorMatrix:imageViews beginOriginY:row_1_origin_y];
    }
    else if ([imageViews count] == 7)
    {
        CGFloat row_1_origin_y = (canvasView.frame.size.height - _cellImageViewchrSideLength * 3) / 4;
        
        UIImageView* imageView_1 = imageViews[0];
        imageView_1.frame = CGRectMake((canvasView.frame.size.width - _cellImageViewchrSideLength) / 2, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
        
        imageViews = [self generatorMatrix:imageViews beginOriginY:row_1_origin_y + _cellImageViewchrSideLength + _margin];
    }
    else if ([imageViews count] == 8)
    {
        CGFloat row_1_origin_y = (canvasView.frame.size.height - _cellImageViewchrSideLength * 3) / 4;
        
        UIImageView* imageView_1 = imageViews[0];
        imageView_1.frame = CGRectMake((canvasView.frame.size.width - 2 * _cellImageViewchrSideLength - _margin) / 2, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
        
        UIImageView* imageView_2 = imageViews[1];
        imageView_2.frame = CGRectMake(imageView_1.frame.origin.x + imageView_1.frame.size.width + _margin, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);

        imageViews = [self generatorMatrix:imageViews beginOriginY:row_1_origin_y + _cellImageViewchrSideLength + _margin];

    }
    else if ([imageViews count] == 9)
    {
        CGFloat row_1_origin_y = (canvasView.frame.size.height - _cellImageViewchrSideLength * 3) / 4;
        imageViews = [self generatorMatrix:imageViews beginOriginY:row_1_origin_y];
    }
    
    for (UIImageView *imageView in imageViews) {
        [canvasView addSubview:imageView];
    }
    
    return canvasView;
}

- (NSArray *)generatorMatrix:(NSArray *)imageViews beginOriginY:(CGFloat)beginOriginY {
    int count = (int)imageViews.count;
    
    int cellCount;
    int maxRow;
    int maxColumn;
    int ignoreCountOfBegining;
    
    if (count <= 4)
    {
        maxRow = 2;
        maxColumn = 2;
        ignoreCountOfBegining = count % 2;
        cellCount = 4;
    }
    else
    {
        maxRow = 3;
        maxColumn = 3;
        ignoreCountOfBegining = count % 3;
        cellCount = 9;
    }
    
    for (int i = 0; i < cellCount; i++) {
        if (i > imageViews.count - 1) break;
        if (i < ignoreCountOfBegining) continue;
        
        int row = floor((float)(i - ignoreCountOfBegining) / maxRow);
        int column = (i - ignoreCountOfBegining) % maxColumn;
        
        CGFloat origin_x = _margin + _cellImageViewchrSideLength * column + _margin * column;
        CGFloat origin_y = beginOriginY + _cellImageViewchrSideLength * row + _margin * row;
        
        UIImageView* imageView = imageViews[i];
        imageView.frame = CGRectMake(origin_x, origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
        
    }
    
    return imageViews;
}

- (void)generateImageViewSideLengthWithCanvasView:(UIView *)canvasView byImageViewsCount:(NSInteger)count {
    CGFloat sideLength = 0.0f;
    
    if (count == 1) {
        sideLength = canvasView.frame.size.width;
    } else if (count >=2 && count <=4) {
        sideLength = (canvasView.frame.size.width - _margin * 3) / 2;
    } else {
        sideLength = (canvasView.frame.size.width - _margin * 4) / 3;
    }
    
    _cellImageViewchrSideLength = sideLength;
}
@end
