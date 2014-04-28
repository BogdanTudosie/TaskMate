//
//  BTTasksViewController.m
//  TaskMate
//
//  Created by Bogdan Tudosie on 16/04/14.
//  Copyright (c) 2014 EazyBreak. All rights reserved.
//

#import "BTTasksViewController.h"
#import "Task.h"
#import "BTAppDelegate.h"
#import "BTTaskTableViewCell.h"
#import "BTTaskInfoViewController.h"

@interface BTTasksViewController ()

@end

@implementation BTTasksViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

@synthesize tasksArray;

// synthesize UI Outlets
@synthesize tasksTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BTAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
    
    // load the tasks, sort by task ID ascending.
    //Fetch Request and Entity Descriptor
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *locations = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:_managedObjectContext];
    
    [request setEntity:locations];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"taskID" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:descriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    
    //now fetch the request
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[_managedObjectContext executeFetchRequest:request error:&error]mutableCopy];
    
    if(mutableFetchResults == nil)
    {
        // handle error
    }
    
    [self setTasksArray:mutableFetchResults];

    [tasksTable setDelegate:self];
    [tasksTable setDataSource:self];
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self.tasksTable reloadData];
    
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Search


#pragma mark TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tasksArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"TaskCell";
    BTTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    

    Task *task = (Task*) [tasksArray objectAtIndex:indexPath.row];

    
    // Configure the cell...
    cell.textLabel.text = [task taskName];
    cell.detailTextLabel.text = [task projectName];
    
    return cell;
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"addSegue"]) {
        // add Task operations
        BTTaskInfoViewController *controller = [segue destinationViewController];
        controller.whoSentYou = @"addSegue";
    }
    else if([[segue identifier] isEqualToString:@"viewInfoSegue"])
    {
        // Task Info segue operations
        NSIndexPath *selectedRowIndex = [tasksTable indexPathForSelectedRow];

        BTTaskInfoViewController *controller = [segue destinationViewController];
        controller.currentTask = [tasksArray objectAtIndex: selectedRowIndex.row];
        controller.whoSentYou = @"viewInfoSegue";
    }
}


@end
