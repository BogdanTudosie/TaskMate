//
//  Task.h
//  TaskMate
//
//  Created by Bogdan Tudosie on 17/04/14.
//  Copyright (c) 2014 EazyBreak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project, User;

@interface Task : NSManagedObject

@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSNumber * hours;
@property (nonatomic, retain) NSString * projectName;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSNumber * taskID;
@property (nonatomic, retain) NSString * taskName;
@property (nonatomic, retain) NSNumber * totalHours;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) Project *taskProject;
@property (nonatomic, retain) User *taskUser;

@end
