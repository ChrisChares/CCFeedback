//
//  CCFeedbackManager.m
//  squarepeg
//
//  Created by Chris Chares on 9/24/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//
#define FEEDBACK_URL @"http://feedback.eunoia.cc/feedback"


#import "CCFeedbackManager.h"
#import "CCFeedback.h"

@interface CCFeedbackManager ()

@property NSOperationQueue *queue;

@end


@implementation CCFeedbackManager

- (id)init
{
    self = [super init];
    self.queue = [[NSOperationQueue alloc] init];
    return self;
}



- (void)sendFeedback:(CCFeedback *)feedback
{
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:FEEDBACK_URL]];
    
    NSDictionary *feedbackDictionary = [feedback toDictionary];
    NSError *error;
    NSData *feedbackData = [NSJSONSerialization dataWithJSONObject:feedbackDictionary options:0 error:&error];
    
    if ( error ) {
        NSLog(@"Error converting feedback to JSON %@", error);
    } else {
        
        urlRequest.HTTPBody = feedbackData;
        urlRequest.HTTPMethod = @"POST";
        [urlRequest setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    }

    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:self.queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               if ( connectionError ) {
                                   NSLog(@"Connection Error: %@", connectionError.localizedDescription);
                                   NSLog(@"Response data %@", data);
                               } else {
                                   NSLog(@"Feedback successfully sent");
                               }
                               
        
    }];
    
    
    
}


@end
