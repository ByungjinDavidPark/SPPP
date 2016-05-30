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
#import "CourseDetailViewController.h"
#import "BrowserTableCell.h"

@interface CourseBrowserController() <UISearchDisplayDelegate, UISearchBarDelegate>

@property (strong,nonatomic) NSArray *courses;
@property (strong,nonatomic) NSArray *filteredCourses;
@property (strong, nonatomic) NSFetchRequest *searchFetchRequest;



@end

@implementation CourseBrowserController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BrowserTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BrowserTableCell"];
    
    NSManagedObjectContext *moc = [self managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Course"
                                                         inManagedObjectContext:moc];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDescription];
    
    NSError *error;
    self.courses = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
//    [[UIImage imageNamed:@"barImage.png"]
//     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    
    [self.navigationController.navigationBar
     setBackgroundImage:[UIImage imageNamed:@"barImage.png"]
     forBarMetrics:UIBarMetricsDefault];
     self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    self.searchFetchRequest = nil;
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *v = (UITableViewHeaderFooterView *)view;
    v.backgroundView.backgroundColor = [UIColor colorWithRed:0.153 green:0.204 blue:0.243 alpha:1.00];
    v.textLabel.textColor = [UIColor whiteColor];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView)
    {
        //return [self.courses count];
        return 3;
    } else {
        return [self.filteredCourses count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    NSString *headerTitle;
    if (section==0) {
        headerTitle = @"Level 5";
    }
    else if(section == 1){
        headerTitle = @"Level 6";
    
    }else if(section == 2){
        headerTitle = @"Level 7";
        
    }
        
    return headerTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"BrowserTableCell";
    
    BrowserTableCell *cell = (BrowserTableCell *)[self.tableView dequeueReusableCellWithIdentifier:tableIdentifier forIndexPath:indexPath];
    
    Course *course = nil;
    
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"browserTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // there are 3 courses for each level
    if (tableView == self.tableView)
    {
        
        if(indexPath.section == 0)
        {
            course = [self.courses objectAtIndex:indexPath.row];

        }else if(indexPath.section == 1)
        {
            course = [self.courses objectAtIndex:indexPath.row+3];

        }else if(indexPath.section == 2)
        {
            course = [self.courses objectAtIndex:indexPath.row+6];
            
        }
    }
    else
    {
        course = [self.filteredCourses objectAtIndex:indexPath.row];
    }

    cell.nameLabel.text = [NSString stringWithFormat:@"%@ ", course.name];
    cell.idLabel.text = course.identifier;
    cell.arrow.text = @">";
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSLog(@"prepareSegue");
    Course *course = nil;
    
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        if (self.searchDisplayController.isActive)
        {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForCell:sender];
            course = [self.filteredCourses objectAtIndex:indexPath.row];
        } else {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            course = [self.courses objectAtIndex:indexPath.row];
        }
        
        CourseDetailViewController *courseDetail = [segue destinationViewController];
        courseDetail.managedObjectContext = self.managedObjectContext;
        courseDetail.course = course;
    }


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
