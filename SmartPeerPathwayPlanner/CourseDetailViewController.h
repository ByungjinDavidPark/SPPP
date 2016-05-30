//
//  CourseDetailViewController.h
//  SmartPeerPathwayPlanner
//
//  Created by David Park on 25/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "StackLabel.h"

@interface CourseDetailViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Course *course;


@property (weak, nonatomic) IBOutlet StackLabel *aimLabel;

@property (weak, nonatomic) IBOutlet StackLabel *topicLabel;

@property (weak, nonatomic) IBOutlet StackLabel *preLabel;
@property (weak, nonatomic) IBOutlet StackLabel *creditLabel;
@property (weak, nonatomic) IBOutlet UILabel *userRatingLabel;

@end
