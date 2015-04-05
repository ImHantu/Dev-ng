//
//  ViewController.m
//  SeeYa
//
//  Created by Im Sergey on 27.11.14.
//  Copyright (c) 2014 Im Sergey. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *Search_bar;
@end


@implementation ViewController {
 GMSMapView *mapView_;
}


 - (void)viewDidLoad {
         self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bwall.jpg" ]];
     [super viewDidLoad];
     GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude: MainPoint1
                                                             longitude: MainPoint2
                                                                  zoom:10];
     mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
     mapView_.myLocationEnabled = YES;
     mapView_.settings.myLocationButton = YES;
     mapView_.settings.zoomGestures = YES;
     self.view = mapView_;
     
     GMSMarker *marker0 = [[GMSMarker alloc] init];
     marker0.position = CLLocationCoordinate2DMake([urcr[0] floatValue],[urcr[1] floatValue]);
     marker0.title = @"You are here";
     //marker.snippet = place1_ad[1];
     marker0.map = mapView_;
     
     GMSMarker *marker00 = [[GMSMarker alloc] init];
     marker00.position = CLLocationCoordinate2DMake([frcr[0] floatValue],[frcr[1] floatValue]);
     marker00.title = @"Your Friend is here";
     //marker.snippet = place1_ad[1];
     marker00.map = mapView_;
     
     //Creates a marker in the center of the map.
     GMSMarker *marker = [[GMSMarker alloc] init];
     marker.position = CLLocationCoordinate2DMake([place1_cr[0] floatValue], [place1_cr[1] floatValue]);
     marker.title = place1_ad[0];
     //marker.snippet = place1_ad[1];
     marker.map = mapView_;
     
     GMSMarker *marker2 = [[GMSMarker alloc] init];
     marker2.position = CLLocationCoordinate2DMake([place2_cr[0] floatValue], [place2_cr[1] floatValue]);
     marker2.title = place2_ad[0];
     //marker2.snippet = place2_ad[1];
     marker2.map = mapView_;
     
     GMSMarker *marker3 = [[GMSMarker alloc] init];
     marker3.position = CLLocationCoordinate2DMake([place3_cr[0] floatValue], [place3_cr[1] floatValue]);
     marker3.title = place3_ad[0];
     // marker3.snippet = place3_ad[1];
     marker3.map = mapView_;
     NSLog(@"end");
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



 @end




/*@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end*/

