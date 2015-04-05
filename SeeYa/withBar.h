//
//  withBar.h
//  SeeYa
//
//  Created by Sergey Im on 04/04/15.
//  Copyright (c) 2015 Im Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface withBar : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *Done;
-(void) queryGooglePlaces: (NSString *) googleType ;
-(void) fetchedData:(NSData *)responseData;
@end
