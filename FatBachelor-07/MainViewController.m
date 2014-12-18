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
    
    
    // Layout a main view
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectZero];
    containerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:containerView];
    
    containerView.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *views = NSDictionaryOfVariableBindings(containerView);
    NSString *visualFormat = @"|-0-[containerView]-0-|";
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views];
    [self.view addConstraints:constraints];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:containerView
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeWidth
                                                                      multiplier:1
                                                                        constant:0.0];
    [self.view addConstraint:widthConstraint];
    
    visualFormat = @"V:|-0-[containerView]-0-|";
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                          options:0
                                                          metrics:nil
                                                            views:views];
    [self.view addConstraints:constraints];

    
    
    TableViewController *calorieTableVC = [TableViewController new];
    [self addChildViewController:calorieTableVC];
    [containerView addSubview:calorieTableVC.view];
    [calorieTableVC didMoveToParentViewController:self];
    [calorieTableVC setDataSource:[CalorieDataSource new] andCellIdentifier:kCalorieCellIdentifier];
    
    
    TableViewController *budgetTableVC = [TableViewController new];
    [self addChildViewController:budgetTableVC];
    [containerView addSubview:budgetTableVC.view];
    [budgetTableVC didMoveToParentViewController:self];
    [budgetTableVC setDataSource:[BudgetDataSource new] andCellIdentifier:kBudgetCellIdentifier];
    
    
    
    
    // Layout the left view on screen
    UIView *calorieTableViewControllerView = calorieTableVC.view;
    calorieTableViewControllerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    views = NSDictionaryOfVariableBindings(calorieTableViewControllerView);
    visualFormat = @"|-0-[calorieTableViewControllerView]";
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views];
    [self.view addConstraints:constraints];
    
    widthConstraint = [NSLayoutConstraint constraintWithItem:calorieTableViewControllerView
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
    
    
    
    // Layout the right view on screen
    UIView *budgetTableViewControllerView = budgetTableVC.view;
    budgetTableViewControllerView.translatesAutoresizingMaskIntoConstraints = NO;
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
                                                  multiplier:0.499
                                                    constant:0.0];
    [self.view addConstraint:widthConstraint];
    
    visualFormat = @"V:|-64-[budgetTableViewControllerView]-0-|";
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                          options:0
                                                          metrics:nil
                                                            views:views];
    
    [self.view addConstraints:constraints];
    
}


@end
