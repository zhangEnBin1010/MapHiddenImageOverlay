//
//  ViewController.m
//  MapHiddenImageOverlay
//
//  Created by ydjh-apple on 2017/8/26.
//  Copyright © 2017年 zeb-apple. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "CustomOverlayRenderer.h"
#import "CustomOverlay.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) CustomOverlay *mapHiddenImageOverlay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mapView];
    [self showOverlay];
}
-(MKMapView *)mapView{
    if (!_mapView) {
        _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _mapView.mapType = MKMapTypeStandard;
        _mapView.delegate = self;
    }
    return _mapView;
}

/**
 *  画覆盖层
 */
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    if([overlay isKindOfClass:[CustomOverlay class]]){
        //遮挡地图图片
        CustomOverlayRenderer *renderer = [[CustomOverlayRenderer alloc] initWithOverlay:overlay];
        return renderer;
    }

    return  nil;
}
//添加覆盖层
- (void)showOverlay {
    
    [self.mapView removeOverlay:self.mapHiddenImageOverlay];
    self.mapHiddenImageOverlay = nil;
    //添加图片遮盖层
    self.mapHiddenImageOverlay = [[CustomOverlay alloc] initWithRect:MKMapRectWorld];
    /*
     MKOverlayLevelAboveRoads = 0,   //显示在路上 建筑名字会显示在覆盖层上方
     MKOverlayLevelAboveLabels //显示在标签上
     */
    [self.mapView addOverlay:self.mapHiddenImageOverlay level:0];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
