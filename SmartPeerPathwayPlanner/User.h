//
//  User.h
//  SmartPeerPathwayPlanner
//
//  Created by Kevin Li on 25/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSManagedObject

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
- (BOOL)userAuthenticated;
@end

NS_ASSUME_NONNULL_END

#import "User+CoreDataProperties.h"
