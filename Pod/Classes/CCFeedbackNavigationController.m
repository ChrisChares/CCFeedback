//
//  CCFeedbackNavigationController.m
//  Pods
//
//  Created by Chris Chares on 9/30/14.
//
//

#import "CCFeedbackNavigationController.h"
#import <ChameleonFramework/Chameleon.h>

@implementation CCFeedbackNavigationController


-(UIStatusBarStyle)preferredStatusBarStyle{
    return StatusBarContrastColorOf(self.navigationBar.barTintColor);
}

@end
