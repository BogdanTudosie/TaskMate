//
//  BTTasksViewController.h
//  TaskMate
//
//  Created by Bogdan Tudosie on 16/04/14.
//  Copyright (c) 2014 EazyBreak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTTasksViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// database array
@property (strong, nonatomic) NSMutableArray *tasksArray;

// IBOutlets
@property (weak, nonatomic) IBOutlet UITableView *tasksTable;

@end
