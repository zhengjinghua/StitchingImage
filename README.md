[English Guide](https://github.com/zhengjinghua/StitchingImage#readme-english)

## 说明

类似**微信**群组封面拼接, 适用于聊天项目中, 之前翻遍了整个 Github 没找着, 就自己整了一个, 顺便开源. 

> Made with :heart: by [The EST Group](http://est-group.org) - We design and build: the Future!

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

[下载](https://github.com//zhengjinghua/StitchingImage/archive/master.zip) 此项目, 并将该项目里的 `Classes` 文件夹里的所有文件复制进你的项目中, 然后在需要调用此项目的地方引入 `#import "StitchingImage.h"` .

## 使用

### 1. 收集头像数组

```objective-c
// 将你要拼接的头像文件放入到一个 NSMutableArray 中
NSMutableArray *imageViews = [[NSMutableArray alloc] init];
    
UIImageView *imageView_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
imageView_1.image = [UIImage imageNamed:@"1.jpg"];
[imageViews addObject:imageView_1];
    
UIImageView *imageView_2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
imageView_2.image = [UIImage imageNamed:@"2.jpg"];
[imageViews addObject:imageView_2];

```

### 2. 准备好画布

```objective-c
// 生成一个背景 canvasView, 用于存放拼接好的群组封面, 相当于背景.
UIImageView *canvasView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
canvasView.layer.cornerRadius = 10;
canvasView.layer.masksToBounds = YES;
canvasView.backgroundColor = [UIColor colorWithWhite:0.839 alpha:1.000];
```

### 3. 绘画并生成

```objective-c   
// 现在你可以调用以下方法, 将用户的头像画到指定的 canvasView 上
UIImageView *coverImage = [[StitchingImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews];

[self.view addSubview:coverImage];
```

### 4. 修改 Margin 

```objective-c  
// 如果你想自定义生成的群组封面里的 margin 值, 你可以调用以下方法
UIImageView *coverImage = [[StitchingImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews marginValue:15.0f];

[self.view addSubview:coverImage];
```

## 协议

StitchingImage 被许可在 MIT 协议下使用. 查阅 LICENSE 文件来获得更多信息.


---
README (English)
==========

## Introduction

Stitching image  just like **WeChat** group chat's cover

> Made with :heart: by [The EST Group](http://est-group.org) - We design and build: the Future!

## Requirements

* iOS7+ project
* ARC project

## Install

### CocoaPods

If you're using [CocoaPods](http://cocoapods.org/) (You are not?! You should!!) just add

``` bash
pod 'StitchingImage', :git => 'https://github.com/zhengjinghua/StitchingImage.git'
```
into your Podfile file.

### Manually

[Download](https://github.com/YannickL/QRCodeReaderViewController/archive/master.zip) the project and copy the `Classes` folder into your project and then simply `#import "StitchingImage.h"` in the file(s) you would like to use it in.


## Usage

### 1. Create NSMutableArray for image views


```objective-c
NSMutableArray *imageViews = [[NSMutableArray alloc] init];
    
UIImageView *imageView_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
imageView_1.image = [UIImage imageNamed:@"1.jpg"];
[imageViews addObject:imageView_1];
    
UIImageView *imageView_2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
imageView_2.image = [UIImage imageNamed:@"2.jpg"];
[imageViews addObject:imageView_2];

```

### 2. Create a canvasView

```objective-c
UIImageView *canvasView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
canvasView.layer.cornerRadius = 10;
canvasView.layer.masksToBounds = YES;
canvasView.backgroundColor = [UIColor colorWithWhite:0.839 alpha:1.000];
```

### 3. Stitching images
```objective-c   
UIImageView *coverImage = [[StitchingImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews];

[self.view addSubview:coverImage];
```

### 4. Change margin value 

```objective-c  
UIImageView *coverImage = [[StitchingImage alloc] stitchingOnImageView:canvasView withImageViews:imageViews marginValue:15.0f];

[self.view addSubview:coverImage];
```

## License

StitchingImage is available under the MIT license. See the LICENSE file for more info.

