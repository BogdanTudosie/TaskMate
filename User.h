//
//  User.h
//  TaskMate
//
//  Created by Bogdan Tudosie on 17/04/14.
//  Copyright (c) 2014 EazyBreak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) Project *userProject;
@property (nonatomic, retain) NSManagedObject *userTask;

@end
