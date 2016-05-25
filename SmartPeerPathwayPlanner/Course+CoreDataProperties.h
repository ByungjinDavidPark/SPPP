//
//  Course+CoreDataProperties.h
//  SmartPeerPathwayPlanner
//
//  Created by David Park on 25/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Course.h"

NS_ASSUME_NONNULL_BEGIN

@interface Course (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *aim;
@property (nullable, nonatomic, retain) NSString *compulsory;
@property (nullable, nonatomic, retain) NSNumber *credit;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *identifier;
@property (nullable, nonatomic, retain) NSNumber *level;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *preRequistes;
@property (nullable, nonatomic, retain) NSString *topic;

@end

NS_ASSUME_NONNULL_END
