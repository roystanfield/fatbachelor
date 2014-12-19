//
//  MainViewController.h
//  FatBachelor-07
//
//  Created by Roy Stanfield on 11/9/14.
//  Copyright (c) 2014 Roy Stanfield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Day.h"
#import "User.h"

@interface MainViewController : UIViewController

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Day *day;

@end
