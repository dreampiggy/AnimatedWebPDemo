//
//  ViewController.m
//  AnimatedWebPDemo
//
//  Created by lizhuoli on 2017/6/29.
//  Copyright © 2017年 DreamPiggy. All rights reserved.
//

#import "ViewController.h"

//SDWebImage
#import <SDWebImage/FLAnimatedImageView+WebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

//YYWebImage
#import <YYWebImage/UIImageView+YYWebImage.h>
#import <YYImage/YYAnimatedImageView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    CGFloat length = [UIScreen mainScreen].bounds.size.width / 3;
    
    NSURL *webpURL1 = [NSURL URLWithString:@"https://isparta.github.io/compare-webp/image/gif_webp/webp/1.webp"];
    NSURL *webpURL2 = [NSURL URLWithString:@"https://isparta.github.io/compare-webp/image/gif_webp/webp/2.webp"];
    NSURL *webpURL3 = [NSURL URLWithString:@"http://s3.pstatp.com/toutiao/static_images/authinfo/webp/2_native.webp"];
    
    // SDWebImage+FLAnimatedImageView
    FLAnimatedImageView *FLImageView1 = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, length, length)];
    FLAnimatedImageView *FLImageView2 = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(1*length, 0, length, length)];
    FLAnimatedImageView *FLImageView3 = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(2*length, 0, length, length)];
    
    [self.view addSubview:FLImageView1];
    [self.view addSubview:FLImageView2];
    [self.view addSubview:FLImageView3];
    
    [FLImageView1 sd_setImageWithURL:webpURL1];
    [FLImageView2 sd_setImageWithURL:webpURL2];
    [FLImageView3 sd_setImageWithURL:webpURL3];
    
    // SDWebImage+UIImageView
    UIImageView *UIImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, length, 1*length, length)];
    UIImageView *UIImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(1*length, 1*length, length, length)];
    UIImageView *UIImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(2*length, 1*length, length, length)];

    [self.view addSubview:UIImageView1];
    [self.view addSubview:UIImageView2];
    [self.view addSubview:UIImageView3];
    
    [UIImageView1 sd_setImageWithURL:webpURL1];
    [UIImageView2 sd_setImageWithURL:webpURL2];
    [UIImageView3 sd_setImageWithURL:webpURL3];
    
    // YYWebImage+YYAnimatedImageView
    YYAnimatedImageView *YYImageView1 = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(0, 2*length, length, length)];
    YYAnimatedImageView *YYImageView2 = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(1*length, 2*length, length, length)];
    YYAnimatedImageView *YYImageView3 = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(2*length, 2*length, length, length)];
    
    [self.view addSubview:YYImageView1];
    [self.view addSubview:YYImageView2];
    [self.view addSubview:YYImageView3];
    
    [YYImageView1 yy_setImageWithURL:webpURL1 options:0];
    [YYImageView2 yy_setImageWithURL:webpURL2 options:0];
    [YYImageView3 yy_setImageWithURL:webpURL3 options:0];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
