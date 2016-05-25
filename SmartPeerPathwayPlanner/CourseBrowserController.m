//
//  SecondViewController.m
//  SmartPeerPathwayPlanner
//
//  Created by David Park on 18/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import "CourseBrowserController.h"
#import "Course.h"
#import "AppDelegate.h"

@interface CourseBrowserController() <UISearchDisplayDelegate, UISearchBarDelegate>

@property (strong,nonatomic) NSArray *courses;
@property (strong,nonatomic) NSArray *filteredCourses;
@property (strong, nonatomic) NSFetchRequest *searchFetchRequest;


@end

@implementation CourseBrowserController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSManagedObjectContext *moc = [self managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Course"
                                                         inManagedObjectContext:moc];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDescription];
    
    NSError *error;
    self.courses = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView)
    {
        return [self.courses count];
    } else {
        return [self.filteredCourses count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Course *course = nil;
    if (tableView == self.tableView)
    {
        course = [self.courses objectAtIndex:indexPath.row];
    }
    else
    {
        course = [self.filteredCourses objectAtIndex:indexPath.row];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@ ", course.name];
    cell.detailTextLabel.text = course.identifier;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Course *course = nil;
    if (self.searchDisplayController.isActive)
    {
        NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForCell:sender];
        course = [self.filteredCourses objectAtIndex:indexPath.row];
    } else {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        course = [self.courses objectAtIndex:indexPath.row];
    }
    
//    DetailViewController *detailVC = [segue destinationViewController];
//    
//    detailVC.managedObjectContext = self.managedObjectContext;
//    detailVC.employee = employee;
}

- (BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self searchForText:searchString];
    return YES;
}

- (void)searchForText:(NSString *)searchText
{
    
    NSLog(@"Search for text %@", searchText);
    
    if (self.managedObjectContext)
    {
        NSString *predicateFormat = @"%K BEGINSWITH[cd] %@";
        NSString *searchAttribute = @"name";
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateFormat, searchAttribute, searchText];
        [self.searchFetchRequest setPredicate:predicate];
        
        NSError *error = nil;
        self.filteredCourses = [self.managedObjectContext executeFetchRequest:self.searchFetchRequest error:&error];
        NSLog(@"search results: %lu", (unsigned long)[self.filteredCourses count]);
    }
}


- (NSFetchRequest *)searchFetchRequest
{
    if (_searchFetchRequest != nil)
    {
        return _searchFetchRequest;
    }
    
    _searchFetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:self.managedObjectContext];
    [_searchFetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    [_searchFetchRequest setSortDescriptors:sortDescriptors];
    
    return _searchFetchRequest;
}





@end
