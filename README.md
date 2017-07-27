# AnimatedWebPDemo
Animated WebP Demo for iOS

# Build
```bash
pod install
```

# Issue
1. `SDWebImage` 4.0 can download, decode ,encode and cache animated WebP image well. But for showing animated image to UI, it relays on `FLAnimatedImageView`, which just use the `UIImageView.image` setter to show animated WebP image.
2. `UIImageView` does not support animated WebP correctly.
3. `YYWebImage` provide an abstract layer to `UIImage` to hold each frame's sprite sheet. And `YYAnimatedImageView` support animated WebP correctly.

# Screenshot
![](https://raw.githubusercontent.com/dreampiggy/AnimatedWebPDemo/sd\_4.0/ScreenShot.png)

# Fixed branch
Fixed Demo branch: [fix\_sd\_animated\_webp\_canvas\_size](https://github.com/dreampiggy/AnimatedWebPDemo/tree/fix_sd_animated_webp_canvas_size)

# Original animated WebP
+ [Cube](https://isparta.github.io/compare-webp/image/gif_webp/webp/1.webp)
+ [Banana](https://isparta.github.io/compare-webp/image/gif_webp/webp/2.webp)
+ [Ball](http://7xsf4p.com1.z0.glb.clouddn.com/image/0/9e/63a17a7087e6ab1a209460b54136b.webp)

You can broswer these animated WebP images using Chrome.
