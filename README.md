## 说明

类似微信讨论组的头像拼接, 适用于聊天项目中, 之前翻遍了整个 Github 没找着, 就自己整了一个, 顺便开源. 

## 截屏

![](http://ww3.sinaimg.cn/large/6d86d850jw1exg1k5v3fwj20bx0fkdho.jpg)
![screenshot](http://7xnfdc.com1.z0.glb.clouddn.com/stitchingImageScreenshot.png?imageView2/2/w/375)

## 系统要求

* iOS7+ project
* ARC project

## 安装

### CocoaPods 安装

将下面代码复制进你的 `Podfile` 文件中

``` bash
pod 'StitchingImage', :git => 'https://github.com/zhengjinghua/StitchingImage.git'
```

### 手工安装

[下载](https://github.com//zhengjinghua/StitchingImage/archive/master.zip) 此项目, 并将该项目里的 `Classes` 文件夹里的所有文件复制进你的项目中, 然后在需要调用此项目的地方引入 `#import "StitchImage.h"` .

## 使用

### 1. 收集头像数组

将你要拼接的头像文件放入到一个 NSMutableArray 中


```objective-c

NSMutableArray *imageViews = [[NSMutableArray alloc] init];
    
UIImageView *imageView_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
imageView_1.image = [UIImage imageNamed:@"1.jpg"];
[imageViews addObject:imageView_1];
    
UIImageView *imageView_2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
imageView_2.image = [UIImage imageNamed:@"2.jpg"];
[imageViews addObject:imageView_2];

```

### 2. 准备好画布

生成一个背景 canvasView, 用于存放拼接好的群组封面, 相当于背景.

```objective-c
UIImageView *canvasView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
canvasView.layer.cornerRadius = 10;
canvasView.layer.masksToBounds = YES;
canvasView.backgroundColor = [UIColor colorWithWhite:0.839 alpha:1.000];
```

### 3. 绘画并生成

现在你可以调用以下方法, 将用户的头像画到指定的 canvasView 上

```objective-c   
[[StitchingImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews];
```

### 4. 修改 Margin 

如果你想自定义生成的群组封面里的 margin 值, 你可以调用以下方法
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


