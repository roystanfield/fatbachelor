//
//  TableViewController.m
//  FatBachelor-07
//
//  Created by Roy Stanfield on 11/9/14.
//  Copyright (c) 2014 Roy Stanfield. All rights reserved.
//

#import "TableViewController.h"
#import "MainViewController.h"
#import "CustomTableViewCell.h"
#import "User.h"
#import "Day.h"
#import "CalorieDataSource.h"
#import "BudgetDataSource.h"


@interface TableViewController () <UITableViewDelegate>

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Day *day;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) id<UITableViewDataSource> dataSource;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.backgroundColor = [UIColor blueColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_tableView);
    NSString *visualFormat = @"|-0-[_tableView]-0-|";
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views];
    [self.view addConstraints:constraints];
    
    visualFormat = @"V:|-0-[_tableView]-0-|";
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                          options:0
                                                          metrics:nil
                                                            views:views];
    [self.view addConstraints:constraints];

    
//    
//    
//    self.user = [User new];
//    self.day = [Day new];
//    self.day.maxCalories = 2000;
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
//    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
//    
//    NSDate *todaysDate = [NSDate date];
//    
//    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
//    [dateFormatter setLocale:usLocale];
//    
//    self.day.date = [dateFormatter stringFromDate:todaysDate];
//    [self.user.days addObject:self.day];
//    
//    NSLog(@"User.days array: %@", self.user.days);
}



- (void)setDataSource:(id<UITableViewDataSource>)dataSource andCellIdentifier:(NSString *)cellIdentifier
{
    if ([self isViewLoaded] == NO) {
        [self view];
    }
    
    self.dataSource = dataSource;
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    [self.tableView reloadData];
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
}






@end
