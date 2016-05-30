//
//  StackLabel.m
//  SmartPeerPathwayPlanner
//
//  Created by David Park on 31/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import "StackLabel.h"

@implementation StackLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.preferredMaxLayoutWidth = self.bounds.size.width;
}

@end
