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
    
    
    TableViewController *tableVC = [TableViewController new];
    tableVC.tableViewDataSource = [CalorieDataSource new];
    [self addChildViewController:tableVC];
    [self.view addSubview:tableVC.view];
    [tableVC didMoveToParentViewController:self];
    
}

@end
