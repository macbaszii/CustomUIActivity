//
//  OZViewController.m
//  CustomUIActivity
//
//  Created by Kiattisak Anoochitarom on 7/24/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZViewController.h"
#import "OZOpenInSafariActivity.h"

@interface OZViewController ()

@end

@implementation OZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)showActivity:(id)sender {
    NSArray *activityItem = @[@"Custom Activity", @"http://www.google.com"];
    NSArray *extendActivityItems = @[[[OZOpenInSafariActivity alloc] init]];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItem applicationActivities:extendActivityItems];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
