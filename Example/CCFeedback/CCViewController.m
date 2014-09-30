//
//  CCViewController.m
//  CCFeedback
//
//  Created by ChrisChares on 09/30/2014.
//  Copyright (c) 2014 ChrisChares. All rights reserved.
//

#import "CCViewController.h"
#import <CCFeedback/CCFeedback.h>

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goFeedback:(id)sender {
    
    UINavigationController *feedbackNav = [CCFeedbackViewController feedbackControllerInNavigationController];
    [self presentViewController:feedbackNav animated:YES completion:NULL];
}

@end
