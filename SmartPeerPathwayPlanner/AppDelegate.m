//
//  AppDelegate.m
//  SmartPeerPathwayPlanner
//
//  Created by David Park on 18/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import "AppDelegate.h"
#import "Course.h"
#import "CourseBrowserController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UITabBarController *parent = (UITabBarController *)self.window.rootViewController;
    
    UINavigationController *navi = (UINavigationController *)parent.viewControllers[1];
    
    CourseBrowserController *controller = (CourseBrowserController *)navi.topViewController;
    
    controller.managedObjectContext = self.managedObjectContext;

    
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"])
    {
        NSLog(@"Initial Run of App");
        {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
        // Add sample data
        
        //level 5
        [self addCourse:@1 courseName:@"Hardware Fundamentals" courseIdentifier:@"ISCG5400" courseLevel:@5 compulsory:@"Yes" courseTopic:@"description function and selection of a wide range of computer hardware components, identifying and configuring hardware resources, describing preventative maintainance of computer hardware, current and emerging trends on Information Technology" courseCredit:@15 coursePreRequistes:@"Restriction: ISCG5232" courseAim:@"Test"];
        
        [self addCourse:@2 courseName:@"Programming Fundamentals" courseIdentifier:@"ISCG5420" courseLevel:@5 compulsory:@"Yes" courseTopic:@"classes, objects, methods, properties, data types decisions, iterations, arrays, text files, logic depiction" courseCredit:@15 coursePreRequistes:@"Restriction: ISCG5232" courseAim:@"To introduce students to the basic principles of designing and developing small computer programs within the context of programming language"];
        
        [self addCourse:@3 courseName:@"Programming Principles and Practice" courseIdentifier:@"ISCG5421" courseLevel:@5 compulsory:@"No" courseTopic:@"classes, objects, methods, properties, data types, decisions, iterations, static and dynamic data structures, graphical user interfaces, inheritance, event-driven programming, text files & binary files, database connection" courseCredit:@15 coursePreRequistes:@"Restriction: ISCG5232" courseAim:@"To advance the knowledge of programming beyond an introductory level, in the context of a programming language."];
        
        // level 6
        
        [self addCourse:@4 courseName:@"Project Planning and Control" courseIdentifier:@"ISCG6411" courseLevel:@6 compulsory:@"Yes" courseTopic:@"identification of the range of requirements for a small IT project, application of these requirements" courseCredit:@15 coursePreRequistes:@"Restriction: ISCG5232" courseAim:@"To provide students with a knowledge of the requirements of project planning by using project management techniques and tools, monitoring and controlling projects, using project management software, and applying reviewing techniques."];
        
        [self addCourse:@5 courseName:@"GUI Programming" courseIdentifier:@"ISCG6421" courseLevel:@6 compulsory:@"No" courseTopic:@"ideveloping and integrating forms, controls and events, integrating with databases, SQL querying, report generation" courseCredit:@15 coursePreRequistes:@"Restriction: ISCG5232" courseAim:@"To provide the student with the concepts of and practice in the use of event driven programming in the context of a selected language and a standard interface using windows, icons, menus and pointers"];
        
        [self addCourse:@6 courseName:@"Data Structures and Algorithms" courseIdentifier:@"ISCG6426" courseLevel:@6 compulsory:@"Yes" courseTopic:@"Topics may include Sorting,Bubble Sort, Insertion Sort, Searching, Brute Force Search, Binary Search, Linked Lists, Stacks, Queues, Binary Trees, Depth First Search, Breadth First Search, Recursion, Hash Tables, Divide and Conquer, Backtracking" courseCredit:@15 coursePreRequistes:@"Restriction: ISCG5232" courseAim:@"This course introduces the fundamental data structures and algorithms used in software development, extending the object-oriented concepts taught in the pre-requisite subject Programming Principles and Practice. The course will cover searching and sorting, linked data structures such lists and trees as well as hash tables. Upon completion of this course students will be able to implement a variety of data structures and algorithms, and will have an expert knowledge of the scalability and design trade-offs of these algorithms"];
        
        // level 7
        
        [self addCourse:@7 courseName:@"Capstone Project" courseIdentifier:@"ISCG7431" courseLevel:@7 compulsory:@"Yes" courseTopic:@"Solving a realistic business problem in the relevant Computing area of study, working closely with sponsoring organisation and supervisor to understand and solve the problem, evidence of project management and the processes" courseCredit:@15 coursePreRequistes:@"Restriction: ISCG5232" courseAim:@"To provide students with the opportunity to research, select, integrate, and apply a range of techniques and technology in the solution of a complete realistic problem. Wherever possible students should undertake a project on behalf of a client or situated in an industrial or business environment."];

        
        [self addCourse:@8 courseName:@"Java Enterprise Programming" courseIdentifier:@"ISCG7425" courseLevel:@7 compulsory:@"No" courseTopic:@"Java Language and Syntax Review, J2EE, Hibernate and Object Relational Mappings, Spring and other J2EE containers, Application Servers, Enterprise Service Bus and Mule, Model View Controllers and Struts, Java Server Faces" courseCredit:@15 coursePreRequistes:@"Restriction: ISCG5232" courseAim:@"To critically review the concepts of enterprise component based programming with the Java programming language. The course will comprehensively examine a range of enterprise technologies and frameworks such as Hibernate, Spring, Struts and Java beans. The subject will also cover RMI and socket programming, and the development of a graphical user interface using the Java Swing library."];

        
        [self addCourse:@9 courseName:@"Data Mining" courseIdentifier:@"ISCG7426" courseLevel:@7 compulsory:@"No" courseTopic:@"iIntroduction to data concepts (data types, attributes etc), Data preparation methods (Data cleansing, Feature Selection etc), Data mining techniques (Clustering, Association rules, Ensemble Learning and Regressions etc) and Evaluation methods" courseCredit:@15 coursePreRequistes:@"Restriction: ISCG5232" courseAim:@"To provide students with the knowledge, tools and techniques required for mining complex data sets and to present the results to non-technical audiences."];

        
        
        
        
    }
    
    
    return YES;
}

-(void) addCourse:(NSNumber *) id
courseName:(NSString *)courseName
courseIdentifier:(NSString *)identifier
courseLevel:(NSNumber*) level
compulsory:(NSString*) compulsory
courseTopic:(NSString *)courseTopic
courseCredit:(NSNumber *)courseCredit
coursePreRequistes:(NSString *)coursePreRequistes
courseAim:(NSString *)courseAim
{
    Course *course = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:self.managedObjectContext];
    
    course.id = id;
    course.name = courseName;
    course.identifier = identifier;
    course.level = level;
    course.compulsory = compulsory;
    course.topic = courseTopic;
    course.credit = courseCredit;
    course.preRequistes = coursePreRequistes;
    course.aim = courseAim;
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error: %@", [error localizedDescription]);
    }

    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
         NSLog(@"returning managedObjectContext within If");
        return _managedObjectContext;
        

    }
    
    NSLog(@"returning managedObjectContext");
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
        NSLog(@"coordinator");
    }
    
    NSLog(@"returning managedObjectContext coordinator");
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CourseDirectory" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CourseDirectory.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();


    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
   return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end

