//
//  Map_ViewController.h
//  SeeYa
//
//  Created by Ким Виталий on 30.11.14.
//  Copyright (c) 2014 Im Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelloPage.h"
NSString *ad1;
NSString *ad2;
NSString *lp;
NSArray *uad, *fad;
@interface Map_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *FrX;

@property (weak, nonatomic) IBOutlet UITextField *UrX;

@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIButton *plusFriend;

-(void) fetchedData1:(NSData *)responseData: (int) side;
- (void) recieve_coor;



//- (IBAction)btn:(UIButton *)sender;

@end
