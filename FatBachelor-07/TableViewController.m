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
#import "CalorieDataSource.h"
#import "BudgetDataSource.h"


@interface TableViewController () <UITableViewDelegate>

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
    
    self.tableView.delegate = self;
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
    
// Here's the issue. I've moved *user and *day up to the MainViewController class.
// Having it in this class meant that everything in viewDidLoad was running twice.
// Now I'm uncertain about how to refer to properties that are intializied in MainViewController's
// viewDidLoad.
    
    Day *currentDay = [self.user.days lastObject];
    
//    
//    currentDay.calories = currentDay.calories + buttonValue;
//
//    
//    NSLog(@"Calories: %ld", currentDay.calories);
//    NSLog(@"User.days array: %@", self.user.days);
}






@end
