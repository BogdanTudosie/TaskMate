//
//  Project.h
//  TaskMate
//
//  Created by Bogdan Tudosie on 17/04/14.
//  Copyright (c) 2014 EazyBreak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Project : NSManagedObject

@property (nonatomic, retain) NSDate * estimatedEndDate;
@property (nonatomic, retain) NSNumber * isCompleted;
@property (nonatomic, retain) NSString * projectName;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSManagedObject *projectTask;
@property (nonatomic, retain) NSManagedObject *projectUser;

@end
