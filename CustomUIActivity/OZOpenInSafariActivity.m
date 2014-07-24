//
//  OZOpenInSafariActivity.m
//  CustomUIActivity
//
//  Created by Kiattisak Anoochitarom on 7/24/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZOpenInSafariActivity.h"

static NSString * const FGOpenInSafariActivityType = @"com.oozou.activity.openinsafari";

@interface OZOpenInSafariActivity()

@property (strong, nonatomic) UIImage *activityImage;
@property (strong, nonatomic) NSURL *firstURLFound;

@end

@implementation OZOpenInSafariActivity

- (id)init {
    if (!(self = [super init])) {
        return nil;
    }
    
    self.activityImage = [UIImage imageNamed:@"Safari-ios7"];
    
    return self;
}

+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryAction;
}

- (NSString *)activityType {
    return FGOpenInSafariActivityType;
}

- (NSString *)activityTitle {
    return @"Open in Safari";
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSString class]] && [self isValidURL:item]) {
            self.firstURLFound = [NSURL URLWithString:item];
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    [[UIApplication sharedApplication] openURL:self.firstURLFound];
}

#pragma mark - Helper

- (BOOL)isValidURL:(NSString *)url {
    NSString *urlRegEx = @"^(http(s)?://)?((www)?\\.)?[\\w]+\\.[\\w]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];

    return [predicate evaluateWithObject:url];
}

@end
