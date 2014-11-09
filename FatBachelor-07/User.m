//
//  User.m
//  FatBachelor-07
//
//  Created by Roy Stanfield on 11/9/14.
//  Copyright (c) 2014 Roy Stanfield. All rights reserved.
//

#import "User.h"

@implementation User

// I don't really understand how User and Day are linked together

- (id)init
{
    self = [super init];
    if (self) {
        self.days = [NSMutableArray array];
    }
    
    return self;
}

@end
