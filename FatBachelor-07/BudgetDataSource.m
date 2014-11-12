//
//  BudgetDataSource.m
//  FatBachelor-07
//
//  Created by Roy Stanfield on 11/9/14.
//  Copyright (c) 2014 Roy Stanfield. All rights reserved.
//

#import "BudgetDataSource.h"
#import "CustomTableViewCell.h"
#import "User.h"
#import "Day.h"
#import "TableViewController.h"

static int kNumberOfRows = 40;

@interface BudgetDataSource ()

@property (nonatomic) NSInteger amountInt;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Day *day;

@end

@implementation BudgetDataSource

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
    cell = [tableView dequeueReusableCellWithIdentifier:kBudgetCellIdentifier];
    
    return cell;
}



@end
