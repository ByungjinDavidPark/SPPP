//
//  User.m
//  SmartPeerPathwayPlanner
//
//  Created by Kevin Li on 25/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import "User.h"

@implementation User

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginActionFinished" object:self userInfo:nil];
}

- (BOOL)userAuthenticated {
    
    // This variable is only for testing
    // Here you have to implement a mechanism to manipulate this
    BOOL auth = NO;
    
    if (auth) {
        return YES;
    }
    
    return NO;
}

@end
