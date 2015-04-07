//
//  ViewController.h
//  SeeYa
//
//  Created by Im Sergey on 27.11.14.
//  Copyright (c) 2014 Im Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelloPage.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)



@interface ViewController : UIViewController
{
    NSArray *TagStr;
}
/*
-(void) queryGooglePlaces: (NSString *) googleType ;
-(void) fetchedData:(NSData *)responseData;
*/
@end

