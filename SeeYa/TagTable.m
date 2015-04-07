//
//  TagTable.m
//  SeeYa
//
//  Created by Sergey Im on 01/04/15.
//  Copyright (c) 2015 Im Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TagTable.h"
#import "HelloPage.h"

@implementation TagTable
@synthesize students;
@synthesize tagNum;

- (void)viewDidLoad {
    self.title = @"Students";
    //Нужно увеличить кол-во статических ячеек в storyboard при добавлении тегов
    self.students = [NSArray arrayWithObjects:@"Meal",/*@"cafe",@"restaurant", @"bakery", @"meal_takeaway",*/ @"Store",@"Library",@"Night Club",@"Museum",@"Park", nil];
    TagStr = @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        switch(indexPath.row) {
            case 0:
                cell.imageView.image = [UIImage imageNamed:@"meal1.png"];                break;
            case 1:
                cell.imageView.image = [UIImage imageNamed:@"store1.png"];                break;
            case 2:
                cell.imageView.image = [UIImage imageNamed:@"library1.png"];                break;
            case 3:
                cell.imageView.image = [UIImage imageNamed:@"nightclub1.png"];                break;
            case 4:
                cell.imageView.image = [UIImage imageNamed:@"museum1.png"];                break;
            case 5:
                cell.imageView.image = [UIImage imageNamed:@"park1.png"];                break;
            default:
                break;
                // do something by default;
        }
    }
    if ([indexPath compare:self.lastIndexPath] == NSOrderedSame)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    // иначе возможна только одна галочка
    /*else
     {
     cell.accessoryType = UITableViewCellAccessoryNone;
     }
     */
    cell.textLabel.text = [students objectAtIndex:indexPath.row];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSString *cache = students[indexPath.row];
//    TagStr = [TagStr stringByAppendingString:cache];
//    TagStr = [TagStr stringByAppendingString:@"+"];
    self.lastIndexPath = indexPath;
    [tableView reloadData];

    switch(indexPath.row) {
        case 0:
            TagStr = [TagStr stringByAppendingString:@"cafe&restaurant&"];
            break;
        case 1:
            TagStr = [TagStr stringByAppendingString:@"store&"];
            break;
        case 2:
            TagStr = [TagStr stringByAppendingString:@"library&"];
            break;
        case 3:
            TagStr = [TagStr stringByAppendingString:@"night_club&"];
        case 4:
            TagStr = [TagStr stringByAppendingString:@"museum&"];
            break;
        case 5:
            TagStr = [TagStr stringByAppendingString:@"park&"];
            break;
        default:
            break;
            // do something by default;
    }
    NSLog(@"%@",TagStr);
    
    
    
}

@end