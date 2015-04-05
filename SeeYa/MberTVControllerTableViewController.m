//
//  MberTVControllerTableViewController.m
//  SeeYa
//
//  Created by Sergey Im on 01/04/15.
//  Copyright (c) 2015 Im Sergey. All rights reserved.
//

#import "MberTVControllerTableViewController.h"
#import "HelloPage.h"

@interface MberTVControllerTableViewController ()

@end

@implementation MberTVControllerTableViewController
@synthesize TagArr;


- (void)viewDidLoad {
    
    self.TagArr = [NSArray arrayWithObjects:@"Korean_Food", @"Japanese_Food", @"Pub", @"Bar",@"Life.Cafe",@"Chuma's_mod", nil];
    


    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return TagArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    if (cell == nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [TagArr objectAtIndex:indexPath.row];
    
    TagStr = @"";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  //  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *cache = TagArr[indexPath.row];
    TagStr = [TagStr stringByAppendingString:cache];
    TagStr = [TagStr stringByAppendingString:@"+"];
    NSLog(@"%@",TagStr);
    
}

@end
