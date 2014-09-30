//
//  CCFeedbackViewController.m
//  squarepeg
//
//  Created by Chris Chares on 9/24/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

#import "CCFeedbackViewController.h"
#import <MBProgressHUD.h>
#import <FontAwesomeKit.h>
#import <Chameleon.h>
#import "CCFeedback.h"
#import "CCFeedbackManager.h"
#import "CCFeedbackNavigationController.h"

@interface CCFeedbackViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label;


@property NSDictionary *userInfo;

@end

@implementation CCFeedbackViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureNavigationItem];
    // Do any additional setup after loading the view from its nib.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardOnScreen:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardOnScreen:) name:UIKeyboardDidShowNotification object:nil];


}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

#pragma mark - Actions
- (void)keyboardOnScreen:(NSNotification *)notification
{
    NSDictionary *info  = notification.userInfo;
    NSValue      *value = info[UIKeyboardFrameEndUserInfoKey];
    CGRect rawFrame      = [value CGRectValue];
    CGRect keyboardFrame = [self.view convertRect:rawFrame fromView:nil];
    
    CGRect slice;
    CGRect remainder;
    CGFloat amount = keyboardFrame.origin.y;

    CGRectDivide(self.view.bounds, &slice, &remainder, amount, CGRectMinYEdge);
    
    CGRect newTextViewRect = CGRectInset(slice, 8, 8);
    
    [UIView animateWithDuration:0.25f animations:^{
        self.textView.frame = newTextViewRect;
        self.label.alpha = 0.0;

    }];
}


- (void)cancel
{
    [self.textView resignFirstResponder];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];


}

- (void)send
{
    
    if ( self.textView.text.length == 0 ) {
        
        [[[UIAlertView alloc] initWithTitle:nil message:@"Please enter some feedback" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] show];
        return;
    }
    
    [self.textView resignFirstResponder];
    
    UIViewController *presenting = self.presentingViewController;
    
    [self sendFeedback];

    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [presenting.view addSubview:HUD];
        
        // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
        FAKFontAwesome *checkMark = [FAKFontAwesome thumbsOUpIconWithSize:37];
        [checkMark addAttribute:NSForegroundColorAttributeName value:FlatWhite];
        UIImage *checkImage = [checkMark imageWithSize:CGSizeMake(37, 37)];
        
        HUD.customView = [[UIImageView alloc] initWithImage:checkImage];
        
        // Set custom view mode
        HUD.mode = MBProgressHUDModeCustomView;
        //        HUD.delegate = self;
        HUD.labelText = @"Thanks!";
        
        [HUD show:YES];
        
        [HUD hide:YES afterDelay:1.0];
        
    }];
    
    
    

}


- (void)sendFeedback
{
    
    NSString *app = [[NSBundle mainBundle] bundleIdentifier];
    CCFeedback *feedback = [[CCFeedback alloc] initWithApp:app label:nil content:self.textView.text];
    feedback.userInfo = self.userInfo;
    
    CCFeedbackManager *fm = [[CCFeedbackManager alloc] init];
    [fm sendFeedback:feedback];
}


- (void)configureNavigationItem
{
    self.title = @"Feedback";
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    UIBarButtonItem *send = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(send)];
    
    self.navigationItem.leftBarButtonItem = cancel;
    self.navigationItem.rightBarButtonItem = send;
}


#pragma mark - Creation

+ (CCFeedbackViewController *)feedbackController
{
    CCFeedbackViewController *vc = [[CCFeedbackViewController alloc] initWithNibName:@"CCFeedbackViewController" bundle:nil];
    vc.edgesForExtendedLayout = UIRectEdgeNone;
    return vc;
}

+ (CCFeedbackViewController *)feedbackControllerWithUserInfoDictionary:(NSDictionary *)userInfo
{
    CCFeedbackViewController *vc = [CCFeedbackViewController feedbackController];
    vc.userInfo = userInfo;
    return vc;
    
}

+ (UINavigationController *)feedbackControllerInNavigationController
{
    CCFeedbackNavigationController *nav = [[CCFeedbackNavigationController alloc] initWithRootViewController:[CCFeedbackViewController feedbackController]];
    return nav;
}

+ (UINavigationController *)feedbackControllerInNavigationControllerWithUserInfoDictionary:(NSDictionary *)userInfo
{
    CCFeedbackNavigationController *nav = [[CCFeedbackNavigationController alloc] initWithRootViewController:[CCFeedbackViewController feedbackControllerWithUserInfoDictionary:userInfo]];
    return nav;
    
}


@end
