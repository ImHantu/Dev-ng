//
//  Map_ViewController.m
//  SeeYa
//
//  Created by Ким Виталий on 30.11.14.
//  Copyright (c) 2014 Im Sergey. All rights reserved.
//

#import "Map_ViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "HelloPage.h"
@interface Map_ViewController ()

@end
 
NSString *KEY = @"AIzaSyAxYFweLCt2a10Hrxpk7hg5t-GGdbkc7fQ";



@implementation Map_ViewController

- (void) recieve_coor {
    NSString *url2 = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=%@&sensor=true&key=%@", ad1, KEY];
    NSURL *googleRequestURL2=[NSURL URLWithString:[url2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData* data2 = [NSData dataWithContentsOfURL: googleRequestURL2];
    
    [self fetchedData1:data2:1];
    NSString *url3 = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=%@&sensor=true&key=%@", ad2, KEY];
    NSURL *googleRequestURL3=[NSURL URLWithString:[url3 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData* data3 = [NSData dataWithContentsOfURL: googleRequestURL3];
    [self fetchedData1:data3:2];
    //[self performSelectorOnMainThread:@selector(fetchedData1::) withObject:data2:ad1 waitUntilDone:YES];
}


-(void)fetchedData1:(NSData*) responseData: (int) side{
    //parse out the json data
    NSError* error1;
    NSDictionary *json1 = [NSJSONSerialization
                           JSONObjectWithData:responseData
                           
                           options:kNilOptions
                           error:&error1];
    
    NSArray* places = [json1 objectForKey:@"results"];
    if ([places count] != 0)
    {
        //NSLog(@"check1");
        if(side == 1)
        {
            frcr = [NSMutableArray arrayWithObjects:
                    places[0][@"geometry"][@"location"][@"lat"], places[0][@"geometry"][@"location"][@"lng"], nil];
        }
        else{ urcr = [NSMutableArray arrayWithObjects:
                      places[0][@"geometry"][@"location"][@"lat"], places[0][@"geometry"][@"location"][@"lng"], nil];
        }
    };
}

- (IBAction)btn:(id)sender{

    //проверка на заполненость textField
    if (([self.UrX.text isEqual:@""]) || ([self.FrX.text isEqual:@""])){
        [self.errorLabel setHidden:NO];
    }
    else
    {
        uad = [ self.UrX.text componentsSeparatedByString: @" " ];
        fad = [ self.FrX.text componentsSeparatedByString: @" " ];
        
        ad1 = @"";
        ad2 = @"";
        for (int i=0; i<[uad count]; i++ )
        {
            ad1 = [ad1 stringByAppendingString: [NSString stringWithFormat:@"%@+", uad[i]]];
        };
        ad1 = [ad1 stringByAppendingString:@"Moscow"];
        for (int i=0; i<[fad count]; i++ )
        {
            ad2 = [ad2 stringByAppendingString: [NSString stringWithFormat:@"%@+", fad[i]]];
        };
        ad2 = [ad2 stringByAppendingString:@"Moscow"];
        [self recieve_coor];
        //переходн на след. view
      gotoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"hello"];
        [self.navigationController pushViewController:gotoVC animated:YES];

    }

}



- (void)viewDidLoad {
    //вставить гифку
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];

    //Не показывает error
    [self.errorLabel setHidden:YES];
   UIImage *btnImage = [UIImage imageNamed:@"check.png"];
    [self.btn setImage:btnImage forState:UIControlStateNormal];
   btnImage = [UIImage imageNamed:@"plus.png"];
    [self.plusFriend setImage:btnImage forState:UIControlStateNormal];
    //Прячет плюс
    [self.plusFriend setHidden:YES];
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
}*/

//    share!!!!
/*   NSString *message = @"AIM!";
 
 NSArray *postItems = @[message];
 
 UIActivityViewController *activityVC = [[UIActivityViewController alloc]
 initWithActivityItems:postItems
 applicationActivities:nil];
 
 [self presentViewController:activityVC animated:YES completion:nil]; */

- (IBAction)TextCopy:(UIButton *)sender {
}
@end
