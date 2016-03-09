//
//  ViewController.m
//  07水印图片
//
//  Created by apple on 15-6-8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 为图片加水印
- (IBAction)btnClick:(id)sender
{

    // 1. 加载原图
    UIImage* img = [UIImage imageNamed:@"dst2"];

    // 2. 根据原图的大小, 创建一个Bitmap的图形上下文
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);

    // 3. 把原图绘制到上下文中
    [img drawAtPoint:CGPointZero];

    // 4. 绘制水印（水印文字、水印图片）
    // 4.1 绘制水印文字
    NSString* strMsg = @"传智播客iOS。";
    NSDictionary* attrs = @{
        NSFontAttributeName : [UIFont systemFontOfSize:25],
        NSForegroundColorAttributeName : [UIColor redColor]
    };
    [strMsg drawAtPoint:CGPointMake(30, 30) withAttributes:attrs];

    // 4.2 绘制图片水印
    // 4.2.1 加载水印图片
    UIImage* imgWatermark = [UIImage imageNamed:@"logo"];
    CGFloat margin = 20;
    CGFloat w = 200;
    CGFloat h = 80;
    CGFloat x = img.size.width - w - margin;
    CGFloat y = img.size.height - h - margin;
    [imgWatermark drawInRect:CGRectMake(x, y, w, h)];

    // 5. 从上下文中取出绘制好的图片
    UIImage* imgFinal = UIGraphicsGetImageFromCurrentImageContext();

    // 6. 关闭上下文
    UIGraphicsEndImageContext();

    // 7. 保存图片
    UIImageWriteToSavedPhotosAlbum(imgFinal, nil, nil, nil);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
