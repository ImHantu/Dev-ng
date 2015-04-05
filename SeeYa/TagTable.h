//
//  TagTable.h
//  SeeYa
//
//  Created by Sergey Im on 01/04/15.
//  Copyright (c) 2015 Im Sergey. All rights reserved.
//

#ifndef SeeYa_TagTable_h
#define SeeYa_TagTable_h
#import <UIKit/UIKit.h>
#endif


@interface TagTable :UITableViewController
{
    NSArray *students;
}

@property (nonatomic, assign) NSInteger *tagNum;
@property(retain)  NSIndexPath* lastIndexPath;
@property (nonatomic, retain) NSArray *students;

//@property (nonatomic, retain) NSString *Tags;
@end
