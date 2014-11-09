//
//  TableViewController.h
//  FatBachelor-07
//
//  Created by Roy Stanfield on 11/9/14.
//  Copyright (c) 2014 Roy Stanfield. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController

@property (nonatomic, strong) id<UITableViewDataSource> tableViewDataSource;

@end
