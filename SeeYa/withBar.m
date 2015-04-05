//
//  withBar.m
//  SeeYa
//
//  Created by Sergey Im on 04/04/15.
//  Copyright (c) 2015 Im Sergey. All rights reserved.
//

#import "withBar.h"

@interface withBar ()


@end

@implementation withBar

- (IBAction)Done:(id)sender {
    NSLog(@"Сделай мне проект, а не катай.");
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

@end
