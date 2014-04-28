//
//  BTAddTaskViewController.h
//  TaskMate
//
//  Created by Bogdan Tudosie on 17/04/14.
//  Copyright (c) 2014 EazyBreak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface BTTaskInfoViewController : UIViewController <UITextFieldDelegate>

// Logic Properties
@property (nonatomic, retain) Task *currentTask;

// IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *taskName;
@property (weak, nonatomic) IBOutlet UITextView *taskDescription;
@property (weak, nonatomic) IBOutlet UITextField *startDate;
@property (weak, nonatomic) IBOutlet UITextField *endDate;
@property (weak, nonatomic) IBOutlet UITextField *hoursEstimated;
@property (weak, nonatomic) IBOutlet UITextField *totalHours;
@property (weak, nonatomic) IBOutlet UIButton *buttonSave;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UITextField *txtEstimated;

// Button for triggering our custom alert view
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonProject;


// Managed data
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


// Other properties
@property (weak, nonatomic) NSString *whoSentYou;

// Actions

- (IBAction)estimatedValueChanged:(id)sender;
- (IBAction)totalHoursValueChanged:(id)sender;
- (IBAction)saveTask:(id)sender;
- (IBAction)addTask:(id)sender;
- (IBAction)setProject:(id)sender;








@end
