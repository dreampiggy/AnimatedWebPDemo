/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "FLAnimatedImageView+WebCache.h"

#if SD_UIKIT
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"
#import "UIView+WebCache.h"
#import "NSData+ImageContentType.h"
#import "FLAnimatedImage.h"
#import "UIImageView+WebCache.h"

@implementation FLAnimatedImageView (WebCache)

- (void)sd_setImageWithURL:(nullable NSURL *)url {
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(SDWebImageOptions)options {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(SDWebImageOptions)options completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder
                   options:(SDWebImageOptions)options
                  progress:(nullable SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(nullable SDExternalCompletionBlock)completedBlock {
    __weak typeof(self)weakSelf = self;
    [self sd_internalSetImageWithURL:url
                    placeholderImage:placeholder
                             options:options
                        operationKey:nil
                       setImageBlock:^(UIImage *image, NSData *imageData) {
                           SDImageFormat imageFormat = [NSData sd_imageFormatForImageData:imageData];
                           if (imageFormat == SDImageFormatGIF) {
                               weakSelf.animatedImage = [FLAnimatedImage animatedImageWithGIFData:imageData];
                               weakSelf.image = nil;
                           } else if (imageFormat == SDImageFormatWebP) {
                               if (image.images.count) {
                                   weakSelf.image = image.images.lastObject;
                                   SEL sd_webpLoopCount = NSSelectorFromString(@"sd_webpLoopCount");
                                   NSNumber *value = objc_getAssociatedObject(image, sd_webpLoopCount);
                                   NSInteger loopCount = value.integerValue;
                                   weakSelf.animationDuration = image.duration;
                                   weakSelf.animationRepeatCount = loopCount;
                                   weakSelf.animationImages = image.images;
                                   [weakSelf startAnimating];
                               } else {
                                   weakSelf.image = image;
                               }
                           } else {
                               weakSelf.image = image;
                               weakSelf.animatedImage = nil;
                           }
                       }
                            progress:progressBlock
                           completed:completedBlock];
}

@end

#endif
