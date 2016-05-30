//
//  BrowserTableCell.m
//  SmartPeerPathwayPlanner
//
//  Created by David Park on 31/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import "BrowserTableCell.h"

@implementation BrowserTableCell
@synthesize nameLabel = _nameLabel;
@synthesize idLabel = _idLabel;



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
