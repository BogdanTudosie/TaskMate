//
//  BTTaskTableViewCell.m
//  TaskMate
//
//  Created by Bogdan Tudosie on 16/04/14.
//  Copyright (c) 2014 EazyBreak. All rights reserved.
//

#import "BTTaskTableViewCell.h"

@implementation BTTaskTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
