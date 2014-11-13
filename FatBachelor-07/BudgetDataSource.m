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

@property (nonatomic) double amountDouble;
@property (nonatomic, readonly) NSNumber *amountDoubleAsNumber;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Day *day;

@end

@implementation BudgetDataSource

- (NSNumber *)amountDoubleAsNumber
{
    return @(self.amountDouble);
}

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
    NSNumberFormatter *moneyFormatter = [[NSNumberFormatter alloc] init];
    [moneyFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    
    
    if (indexPath.row == 0) {
        self.amountDouble = 0.50;
        NSString *amountString = [moneyFormatter stringFromNumber:self.amountDoubleAsNumber];
        cell.textLabel.text = amountString;
    } else {
        self.amountDouble = indexPath.row * 0.5 + 0.5;
        NSString *amountString = [moneyFormatter stringFromNumber:self.amountDoubleAsNumber];
        cell.textLabel.text = amountString;
    }
    
//    cell.textLabel.font = [UIFont fontWithName:@"ProximaNovaA-Regular" size:19];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}



@end
