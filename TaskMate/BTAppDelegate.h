//
//  BTAppDelegate.h
//  TaskMate
//
//  Created by Bogdan Tudosie on 16/04/14.
//  Copyright (c) 2014 EazyBreak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
