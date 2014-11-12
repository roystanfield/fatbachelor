//
//  MainViewController.m
//  FatBachelor-07
//
//  Created by Roy Stanfield on 11/9/14.
//  Copyright (c) 2014 Roy Stanfield. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewController.h"
#import "CalorieDataSource.h"
#import "BudgetDataSource.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *navigationBarLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSString *navBarTitle = @"Fat Bachelor";
    navBarTitle = [navBarTitle uppercaseString];
    self.navigationBarLabel.text = navBarTitle;
    
    
    TableViewController *calorieTableVC = [TableViewController new];
    [calorieTableVC setDataSource:[CalorieDataSource new] andCellIdentifier:kCalorieCellIdentifier];
    [self addChildViewController:calorieTableVC];
    [self.view addSubview:calorieTableVC.view];
    [calorieTableVC didMoveToParentViewController:self];
    
    
    TableViewController *budgetTableVC = [TableViewController new];
    [budgetTableVC setDataSource:[BudgetDataSource new] andCellIdentifier:kBudgetCellIdentifier];
    budgetTableVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addChildViewController:budgetTableVC];
    [self.view addSubview:budgetTableVC.view];
    [budgetTableVC didMoveToParentViewController:self];
    
    
    
    
    
    
    
    
    
    
    
    // Layout the left view on screen
    UIView *calorieTableViewControllerView = calorieTableVC.view;
    NSDictionary *views = NSDictionaryOfVariableBindings(calorieTableViewControllerView);
    NSString *visualFormat = @"|-0-[calorieTableViewControllerView]";
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views];
    [self.view addConstraints:constraints];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:calorieTableViewControllerView
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeWidth
                                                                      multiplier:0.5
                                                                        constant:0.0];
    [self.view addConstraint:widthConstraint];
    
    visualFormat = @"V:|-0-[calorieTableViewControllerView]-0-|";
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                          options:0
                                                          metrics:nil
                                                            views:views];
    [self.view addConstraints:constraints];
    

    
    // Layout the left view on screen
    UIView *budgetTableViewControllerView = budgetTableVC.view;
    budgetTableViewControllerView.backgroundColor = [UIColor redColor];
    views = NSDictionaryOfVariableBindings(budgetTableViewControllerView);
    visualFormat = @"[budgetTableViewControllerView]-0-|";
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                           options:0
                                                           metrics:nil
                                                             views:views];
    [self.view addConstraints:constraints];
    
    widthConstraint = [NSLayoutConstraint constraintWithItem:budgetTableViewControllerView
                                                   attribute:NSLayoutAttributeWidth
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self.view
                                                   attribute:NSLayoutAttributeWidth
                                                  multiplier:0.5
                                                    constant:0.0];
    [self.view addConstraint:widthConstraint];
    
    visualFormat = @"V:|-0-[budgetTableViewControllerView]-0-|";
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                          options:0
                                                          metrics:nil
                                                            views:views];
    [self.view addConstraints:constraints];
    
}

@end
