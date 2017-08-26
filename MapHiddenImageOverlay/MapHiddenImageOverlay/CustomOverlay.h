//
//  CustomOverlay.h
//  projecthz
//
//  Created by ydjh-apple on 2017/8/20.
//  Copyright © 2017年 tali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomOverlay : NSObject<MKOverlay>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) MKMapRect boundingMapRect;

- (id)initWithRect:(MKMapRect)rect;

@end
