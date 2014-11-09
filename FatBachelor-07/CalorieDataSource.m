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

static NSString *cellIdentifier = @"Cell";
static int kNumberOfRows = 40;

@interface CalorieDataSource ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) NSInteger amountInt;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Day *day;

@end

@implementation CalorieDataSource

- (void)viewDidLoad {

    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
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
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (indexPath.row == 0) {
        self.amountInt = 50;
        NSString *amountString = [NSString stringWithFormat:@"%ld", (long)self.amountInt];
        cell.textLabel.text = amountString;
    } else {
        self.amountInt = indexPath.row * 50 + 50;
        NSString *amountString = [NSString stringWithFormat:@"%ld", (long)self.amountInt];
        cell.textLabel.text = amountString;
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"ProximaNovaA-Regular" size:19];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    long buttonValue = 0;
    
    if (indexPath.row == 0) {
        buttonValue = indexPath.row + 50;
    } else {
        buttonValue = indexPath.row * 50 + 50;
    }
    
    NSLog(@"Button Value: %ld", buttonValue);
    
    Day *currentDay = [self.user.days lastObject];
    currentDay.calories = currentDay.calories + buttonValue;
    
    NSLog(@"User.days array: %@", self.user.days);
    
//    NSString *currentCalories = [currentDay description];
//    
//    self.user1[@"Today"] = currentCalories;
//    [self.user1 saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//
//    }];
//
//    PFObject *testObject2 = [PFObject objectWithClassName:@"TestObject2"];
//    testObject2[@"foo"] = @"bar";
//    [testObject2 saveInBackground];
}


@end
