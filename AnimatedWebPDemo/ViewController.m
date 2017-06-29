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
    
    NSURL *webpURL1 = [NSURL URLWithString:@"http://7xsf4p.com1.z0.glb.clouddn.com/image/0/9e/63a17a7087e6ab1a209460b54136b.webp09e63a17a7087e6ab1a209460b54136b.webp"];
    NSURL *webpURL2 = [NSURL URLWithString:@"https://isparta.github.io/compare-webp/image/gif_webp/webp/2.webp"];
    
    // SDWebImage+FLAnimatedImageView
    FLAnimatedImageView *FLImageView1 = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    FLAnimatedImageView *FLImageView2 = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(200, 0, 200, 200)];
    
    [self.view addSubview:FLImageView1];
    [self.view addSubview:FLImageView2];
    
    [FLImageView1 sd_setImageWithURL:webpURL1];
    [FLImageView2 sd_setImageWithURL:webpURL2];
    
    // SDWebImage+UIImageView
    UIImageView *UIImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, 200, 200)];
    UIImageView *UIImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 200, 200)];

    [self.view addSubview:UIImageView1];
    [self.view addSubview:UIImageView2];
    
    [UIImageView1 sd_setImageWithURL:webpURL1];
    [UIImageView2 sd_setImageWithURL:webpURL2];
    
    // YYWebImage+YYAnimatedImageView
    YYAnimatedImageView *YYImageView1 = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(0, 400, 200, 200)];
    YYAnimatedImageView *YYImageView2 = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(200, 400, 200, 200)];
    
    [self.view addSubview:YYImageView1];
    [self.view addSubview:YYImageView2];
    
    [YYImageView1 yy_setImageWithURL:webpURL1 options:0];
    [YYImageView2 yy_setImageWithURL:webpURL2 options:0];
    
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
