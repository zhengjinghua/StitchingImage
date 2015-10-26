//
//  ViewController.m
//  StitchingImage
//
//  Created by Jin on 10/9/15.
//  Copyright © 2015 Jin. All rights reserved.
//

#import "ViewController.h"
#import "StitchImage.h"

#define DeviceWidth [UIScreen mainScreen].bounds.size.width
#define DeviceHeight [UIScreen mainScreen].bounds.size.height

const CGFloat canvasViewSideLength = 100.0f;

@interface ViewController ()
{
    CGFloat _beginningY;
    CGFloat _canvasViewMargin;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"example";
    
    _canvasViewMargin = (DeviceWidth - canvasViewSideLength * 3) / 4;
    _beginningY = (DeviceHeight - canvasViewSideLength * 3 - _canvasViewMargin * 2) / 2;
    
    [self createCanvasViews];
}

- (void)createCanvasViews {
    int maxRow = 3;
    int maxColumn = 3;
    
    for (int i = 0; i < 9; i++) {
        int row = floor((float)i / maxRow);
        int column = i % maxColumn;
        
        CGFloat originX = _canvasViewMargin + column * canvasViewSideLength + column * _canvasViewMargin;
        CGFloat originY = _beginningY + row * canvasViewSideLength + row * _canvasViewMargin;
        
        UIImageView *canvasView = [[UIImageView alloc] initWithFrame:CGRectMake(originX, originY, canvasViewSideLength, canvasViewSideLength)];
        canvasView.layer.cornerRadius = canvasViewSideLength / 10;
        canvasView.layer.masksToBounds = YES;
        canvasView.backgroundColor = [UIColor colorWithWhite:0.839 alpha:1.000];
        
        int imageViewsCount = i + 1;
        UIImageView *exampleView = [self createImageViewWithCanvasView:canvasView withImageViewsCount:imageViewsCount];
        
        [self.view addSubview:exampleView];
    }
}

- (UIImageView *)createImageViewWithCanvasView:(UIImageView *)canvasView withImageViewsCount:(NSInteger)count {
    NSMutableArray *imageViews = [[NSMutableArray alloc] init];
    
    for (int index = 1; index <= count; index++) {
        UIImageView *imageView = [UIImageView new];
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", index]];
        imageView.image = image;
        
        [imageViews addObject:imageView];
    }
    
    return [[StitchImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews];
}

@end
