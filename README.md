## StitchingImage
在之前的公司项目中, 有一个类似生成微信群组封面 (即将指定数量用户的头像拼接成一个新的封面) 的需求, 在开发的过程中发现没有人写过相应的比较好的解决方案, 因此我自己造了一个轮子, 希望能帮助到有同类需求的同学.

## Screenshot
![screenshot](http://7xnfdc.com1.z0.glb.clouddn.com/stitchingImageScreenshot.png?imageView2/2/w/375)


## Install

### CocoaPods
If you're using [CocoaPods](http://cocoapods.org/) (You are not?! You should!!) just add

``` bash
pod 'StitchingImage', :git => 'https://github.com/zhengjinghua/StitchingImage.git'
```
into your Podfile file.

### Manually

[Download](https://github.com//zhengjinghua/StitchingImage/archive/master.zip) the project and copy the `Classes` folder into your project and then simply `#import "StitchImage.h"` in the file(s) you would like to use it in.

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

#### Create a canvasView

```objective-c
UIImageView *canvasView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
canvasView.layer.cornerRadius = 10;
canvasView.layer.masksToBounds = YES;
canvasView.backgroundColor = [UIColor colorWithWhite:0.839 alpha:1.000];
```

#### You can stitching image right now

```objective-c   
[[StitchingImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews];
```

#### If you want to change margin value, you can use
```objective-c  
[[StitchingImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews marginValue:15.0f]
```

## License (MIT)

Copyright (c) 2014-present - Yannick Loriot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


