//
//  CCFeedback.m
//  squarepeg
//
//  Created by Chris Chares on 9/24/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

#import "CCFeedback.h"

@implementation CCFeedback

- (instancetype)initWithApp:(NSString *)app label:(NSString *)label content:(NSString *)content
{
    self = [super init];
    self.app = app;
    self.label = label;
    self.content = content;
    return self;
}

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *d = [NSMutableDictionary new];
    
    if ( self.app ) {
        d[@"app"] = self.app;
    }
    if ( self.label ) {
        d[@"label"] = self.label;
    }
    if ( self.content ) {
        d[@"content"] = self.content;
    }
    if ( self.userInfo ) {
        d[@"userInfo"] = self.userInfo;
    }
    
    return d;
}

@end
