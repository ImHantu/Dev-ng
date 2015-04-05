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

-(void) queryGooglePlaces: (NSString *) googleType {
    // Build the url string to send to Google. NOTE: The kGOOGLE_API_KEY is a constant that should contain your own API key that you obtain from Google. See this link for more info:
    //https://developers.google.com/maps/documentation/places/#Authentication
    NSString *kGOOGLE_API_KEY = @"AIzaSyAxYFweLCt2a10Hrxpk7hg5t-GGdbkc7fQ";
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%@&types=%@&sensor=false&key=%@", 55.752222, 37.591111, [NSString stringWithFormat:@"%i", 200], googleType, kGOOGLE_API_KEY];
    //координаты арбата
    //Formulate the string as a URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
    // Retrieve the results of the URL.
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
               [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}

-(void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"results"];
}

 - (void)viewDidLoad {
         self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bwall.jpg" ]];
     [super viewDidLoad];
 // Create a GMSCameraPosition that tells the map to display the
 // coordinate -33.86,151.20 at zoom level 15.
 GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude: 55.752222//55.754
 longitude:37.591111//37.653
 zoom:15];
 mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
 mapView_.myLocationEnabled = YES;
     mapView_.settings.myLocationButton = YES;
     mapView_.settings.zoomGestures = YES;
 self.view = mapView_;
 
 // Creates a marker in the center of the map.
 GMSMarker *marker = [[GMSMarker alloc] init];
 marker.position = CLLocationCoordinate2DMake(55.75, 37.65);
 marker.title = @"Place #1";
 marker.snippet = @"Moscow";
 marker.map = mapView_;
     
 GMSMarker *marker2 = [[GMSMarker alloc] init];
 marker2.position = CLLocationCoordinate2DMake(55.751, 37.65075);
 marker2.title = @"Place #2";
 marker2.snippet = @"Moscow";
 marker2.map = mapView_;
     
 GMSMarker *marker3 = [[GMSMarker alloc] init];
 marker3.position = CLLocationCoordinate2DMake(55.75, 37.6515);
 marker3.title = @"Place #3";
 marker3.snippet = @"Moscow";
 marker3.map = mapView_;
 NSLog(@"end");
 NSString *request = @"cafe";
 [self queryGooglePlaces: request];
     
     
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 @end