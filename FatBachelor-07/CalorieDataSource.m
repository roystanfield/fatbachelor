//
//  CalorieDataSource.m
//  FatBachelor-07
//
//  Created by Roy Stanfield on 11/9/14.
//  Copyright (c) 2014 Roy Stanfield. All rights reserved.
//

#import "CalorieDataSource.h"
#import "CustomTableViewCell.h"
#import "User.h"
#import "Day.h"
#import "TableViewController.h"

static int kNumberOfRows = 40;

@interface CalorieDataSource ()

@property (nonatomic) NSInteger amountInt;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Day *day;

@end

@implementation CalorieDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kNumberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [[CustomTableViewCell alloc] init];
    cell = [tableView dequeueReusableCellWithIdentifier:kCalorieCellIdentifier];
    
    if (indexPath.row == 0) {
        self.amountInt = 50;
        NSString *amountString = [NSString stringWithFormat:@"%ld", (long)self.amountInt];
        cell.textLabel.text = amountString;
    } else {
        self.amountInt = indexPath.row * 50 + 50;
        NSString *amountString = [NSString stringWithFormat:@"%ld", (long)self.amountInt];
        cell.textLabel.text = amountString;
    }

//    cell.textLabel.font = [UIFont fontWithName:@"ProximaNovaA-Regular" size:19];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    
    return cell;
}



@end
