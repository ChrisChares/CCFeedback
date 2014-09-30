//
//  CCFeedbackViewController.h
//  squarepeg
//
//  Created by Chris Chares on 9/24/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCFeedbackViewController : UIViewController

+ (CCFeedbackViewController *)feedbackController;
+ (CCFeedbackViewController *)feedbackControllerWithUserInfoDictionary:(NSDictionary *)userInfo;

+ (UINavigationController *)feedbackControllerInNavigationController;
+ (UINavigationController *)feedbackControllerInNavigationControllerWithUserInfoDictionary:(NSDictionary *)userInfo;




@end
