//
//  CCFeedback.h
//  squarepeg
//
//  Created by Chris Chares on 9/24/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCFeedback : NSObject

@property NSString *app;

@property NSString *label;
@property NSString *content;
@property NSDictionary *userInfo;


- (NSDictionary *)toDictionary;

- (instancetype)initWithApp:(NSString *)app label:(NSString *)label content:(NSString *)content;

@end
