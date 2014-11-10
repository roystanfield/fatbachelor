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
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor redColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self.tableViewDataSource;
    
//
//    TableViewController *calorieViewController = [[TableViewController alloc] init];
//    calorieViewController.tableViewDataSource = [[CalorieDataSource alloc] init];
//    
//    TableViewController *budgetViewController = [[TableViewController alloc] init];
//    budgetViewController.tableViewDataSource = [[BudgetDataSource alloc] init];
//    
//    [self addChildViewController:calorieViewController];
//    [self addChildViewController:budgetViewController];
//    
//    calorieViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width / 2, self.view.frame.size.height);
//    budgetViewController.view.frame = CGRectMake(self.view.frame.size.width / 2, self.navigationController.navigationBar.frame.size.height + 20, self.view.frame.size.width / 2, self.view.frame.size.height);
//    
//    [self.view addSubview:calorieViewController.view];
//    [self.view addSubview:budgetViewController.view];
//    
//    [calorieViewController didMoveToParentViewController:self];
//    [budgetViewController didMoveToParentViewController:self];
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

- (void)setTableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource
{
    _tableViewDataSource = tableViewDataSource;
    self.tableView.dataSource = _tableViewDataSource;
}



@end
