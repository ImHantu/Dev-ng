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
 




@implementation Map_ViewController


- (IBAction)btn:(id)sender{
    FrAdress = self.TextF.text;
    UrAdress = self.UrText.text;
    NSLog(@"%@%@",FrAdress,UrAdress);
}



- (void)viewDidLoad {
    //вставить гифку
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bwall.jpg" ]];
   UIImage *btnImage = [UIImage imageNamed:@"check.png"];
    [self.btn setImage:btnImage forState:UIControlStateNormal];
   btnImage = [UIImage imageNamed:@"plus.png"];
    [self.plusFriend setImage:btnImage forState:UIControlStateNormal];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TextCopy:(UIButton *)sender {
}
@end
