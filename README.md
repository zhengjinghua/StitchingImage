## screenshot
![screenshot](http://7xnfdc.com1.z0.glb.clouddn.com/stitchingImageScreenshot.png?imageView2/2/w/320)

## Install

### CocoaPods
If you're using [CocoaPods](http://cocoapods.org/) (You are not?! You should!!) just add

``` bash
pod 'StitchingImage', :git => 'https://github.com/zhengjinghua/StitchingImage.git'
```
into your Podfile file.

### Manually

[Download](https://github.com/YannickL/QRCodeReaderViewController/archive/master.zip) the project and copy the `Classes` folder into your project and then simply `#import "StitchImage.h"` in the file(s) you would like to use it in.

## Usage

#### Create NSMutableArray for image views

```objective-c

NSMutableArray *imageViews = [[NSMutableArray alloc] init];
    
UIImageView *imageView_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
imageView_1.image = [UIImage imageNamed:@"1.jpg"];
[imageViews addObject:imageView_1];
    
UIImageView *imageView_2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
imageView_2.image = [UIImage imageNamed:@"2.jpg"];
[imageViews addObject:imageView_2];

```

#### Stitch image

```objective-c   
    
[[StitchImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews];

```

#### If you want to change margin value, you can use
```objective-c  
[[StitchImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews marginValue:15.0f]
```




