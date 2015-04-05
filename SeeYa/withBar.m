//
//  withBar.m
//  SeeYa
//
//  Created by Sergey Im on 04/04/15.
//  Copyright (c) 2015 Im Sergey. All rights reserved.
//

#import "withBar.h"
#import "HelloPage.h"

@interface withBar ()


@end

NSString *APIKEY = @"AIzaSyAxYFweLCt2a10Hrxpk7hg5t-GGdbkc7fQ";

@implementation withBar

- (IBAction)Done:(id)sender {
    TagStr = [TagStr substringToIndex:[TagStr length]-1];
    NSLog(TagStr);
    [self queryGooglePlaces: TagStr];
}

- (void) queryGooglePlaces: (NSString *) googleType {
    MainPoint1=([urcr[0] floatValue]+[frcr[0] floatValue])/2;
    MainPoint2=([frcr[1] floatValue]+[urcr[1] floatValue])/2;
   // NSLog(@"MAIN1%f_MAIN2%f_1%@_2%@_3%@_4%@",MainPoint2,MainPoint1,urcr[0],urcr[1],frcr[0],frcr[1]);
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%@&types=%@&sensor=false&key=%@", MainPoint1, MainPoint2, [NSString stringWithFormat:@"%i", 500], googleType, APIKEY];
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
    [self fetchedData:data];
    // [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* places = [json objectForKey:@"results"];
    if ([places count] != 0)
    {
        //NSLog(@"check1");
        
        place1_ad = [NSMutableArray arrayWithObjects:
                     places[0][@"name"], places[0][@"vinicity"],nil];
        place1_cr = [NSMutableArray arrayWithObjects:
                     places[0][@"geometry"][@"location"][@"lat"], places[0][@"geometry"][@"location"][@"lng"], nil];
    };
    if ([places count] > 1)
    {
        //NSLog(@"check2");
        
        place2_ad = [NSMutableArray arrayWithObjects:
                     places[1][@"name"], places[1][@"vinicity"],nil];
        place2_cr = [NSMutableArray arrayWithObjects:
                     places[1][@"geometry"][@"location"][@"lat"], places[1][@"geometry"][@"location"][@"lng"], nil];
    };
    
    if ([places count] > 2)
    {
        //NSLog(@"check3");
        
        place3_ad = [NSMutableArray arrayWithObjects:
                     places[2][@"name"], places[2][@"vinicity"],nil];
        place3_cr = [NSMutableArray arrayWithObjects:
                     places[2][@"geometry"][@"location"][@"lat"], places[2][@"geometry"][@"location"][@"lng"], nil];
    };
    
}




- (void)viewDidLoad {
    
    UIImage *btnImage = [UIImage imageNamed:@"check.png"];
    [self.Done setImage:btnImage forState:UIControlStateNormal];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
