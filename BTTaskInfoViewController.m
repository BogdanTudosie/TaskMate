//
//  BTAddTaskViewController.m
//  TaskMate
//
//  Created by Bogdan Tudosie on 17/04/14.
//  Copyright (c) 2014 EazyBreak. All rights reserved.
//

#import "BTTaskInfoViewController.h"
#import "BTAppDelegate.h"

@interface BTTaskInfoViewController ()

@end

@implementation BTTaskInfoViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

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
    
    if([self.whoSentYou  isEqual: @"addSegue"])
    {
        // do nothing, just wait for input
    }
    else if([self.whoSentYou isEqual: @"viewInfoSegue"])
    {
        // build dates
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        NSString *startDate = [formatter stringFromDate:[self.currentTask valueForKey:@"startDate"]];
        NSString *endDate = [formatter stringFromDate:[self.currentTask valueForKey:@"endDate"]];
        
    
        // set text fields
        self.taskName.text = [self.currentTask taskName];
        self.taskDescription.text = [self.currentTask comments];
        self.startDate.text = startDate;
        self.endDate.text = endDate;
        self.txtEstimated.text = [[self.currentTask hours] stringValue];
        self.totalHours.text = [[self.currentTask totalHours] stringValue];
    }
    
    // set delegates
    
    _txtEstimated.delegate = self;
    _taskName.delegate = self;
    _startDate.delegate = self;
    _endDate.delegate = self;
    _txtEstimated.delegate = self;
    _totalHours.delegate = self;
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)estimatedValueChanged:(id)sender {
    
    
    
}

- (IBAction)totalHoursValueChanged:(id)sender {
}

- (IBAction)saveTask:(id)sender {
    
    
    NSString *name = _taskName.text;
    NSString *desc = _taskDescription.text;
    // date formatter
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setTimeStyle:[NSTimeZone systemTimeZone]];
    [dateFormat setLocale:[NSLocale currentLocale]];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSDate *start = [dateFormat dateFromString:_startDate.text];
    NSDate *end = [dateFormat dateFromString:_endDate.text];
    NSNumber *estimated = [NSNumber numberWithFloat:[_txtEstimated.text floatValue]];
    NSNumber *total = [NSNumber numberWithFloat:[_totalHours.text floatValue]];
    
    // now Save the data
    NSError *error = nil;
    
    [_currentTask setValue:name forKey:@"taskName"];
    [_currentTask setValue:desc forKey:@"comments"];
    [_currentTask setValue:start forKey:@"startDate"];
    [_currentTask setValue:end forKey:@"endDate"];
    [_currentTask setValue:estimated forKey:@"hours"];
    [_currentTask setValue:total forKey:@"totalHours"];
    
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Unresolved error: %@ %@",error,[error userInfo]);
        abort();
    }
}

- (IBAction)addTask:(id)sender
{
 
    NSString *name = _taskName.text;
    NSString *desc = _taskDescription.text;
    // date formatter
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setTimeStyle:[NSTimeZone systemTimeZone]];
    [dateFormat setLocale:[NSLocale currentLocale]];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSDate *start = [dateFormat dateFromString:_startDate.text];
    NSDate *end = [dateFormat dateFromString:_endDate.text];
    NSNumber *estimated = [NSNumber numberWithFloat:[_txtEstimated.text floatValue]];
    NSNumber *total = [NSNumber numberWithFloat:[_totalHours.text floatValue]];
    
    _currentTask = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:_managedObjectContext];
    
    [_currentTask setTaskName:name];
    [_currentTask setComments:desc];
    [_currentTask setStartDate:start];
    [_currentTask setEndDate:end];
    [_currentTask setHours:estimated];
    [_currentTask setTotalHours:total];
    
    // now Save the data
    NSError *error = nil;
    
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Unresolved error: %@ %@",error,[error userInfo]);
        abort();
    }
}

- (IBAction)setProject:(id)sender
{
}
@end
