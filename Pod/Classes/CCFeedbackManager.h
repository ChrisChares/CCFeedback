//
//  CCFeedbackManager.h
//  squarepeg
//
//  Created by Chris Chares on 9/24/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCFeedback;


@interface CCFeedbackManager : NSObject

- (void)sendFeedback:(CCFeedback *)feedback;

@end
