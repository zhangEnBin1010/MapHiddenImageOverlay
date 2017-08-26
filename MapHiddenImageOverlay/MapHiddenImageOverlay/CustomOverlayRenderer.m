//
//  CustomOverlayRenderer.m
//  projecthz
//
//  Created by ydjh-apple on 2017/8/20.
//  Copyright © 2017年 tali. All rights reserved.
//

#import "CustomOverlayRenderer.h"
#import "CustomOverlay.h"

@interface CustomOverlayRenderer ()

@property (nonatomic, strong) UIImage *image;

@end

@implementation CustomOverlayRenderer

- (id) initWithOverlay:(id<MKOverlay>)overlay{
    self = [super initWithOverlay:overlay];
    if (self){
        self.image = [UIImage imageNamed:@"MapHiddenBG.png"];
    }
    return self;
}

- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context
{
    @autoreleasepool {
        CustomOverlay *overlay = (CustomOverlay *)self.overlay;
        
        if (overlay == nil)
        {
            NSLog(@"overlay is nil");
            return;
        }
        
        MKMapRect theMapRect    = [self.overlay boundingMapRect];
        CGRect theRect          = [self rectForMapRect:theMapRect];
        
        // 绘制image
        CGImageRef imageReference = self.image.CGImage;
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextTranslateCTM(context, 0.0, -theRect.size.height);
        CGContextDrawImage(context, theRect, imageReference);
    }
}

@end
