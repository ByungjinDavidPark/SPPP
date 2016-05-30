//
//  SecondViewController.h
//  SmartPeerPathwayPlanner
//
//  Created by David Park on 18/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CourseBrowserController: UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *browserTableView;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

