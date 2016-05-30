//
//  BrowserTableCell.h
//  SmartPeerPathwayPlanner
//
//  Created by David Park on 31/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *idLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrow;

@end
