//
//  CourseDetailViewController.m
//  SmartPeerPathwayPlanner
//
//  Created by David Park on 25/05/16.
//  Copyright © 2016 David Park. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "Course.h"

@interface CourseDetailViewController ()



@end

@implementation CourseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

-(void) initView
{
   
    if(self.course)
    {
        
        self.topicLabel.text = [NSString stringWithFormat:@"%@",self.course.topic];
        self.aimLabel.text = [NSString stringWithFormat:@"%@",self.course.aim];
        self.preLabel.text = [NSString stringWithFormat:@"%@",self.course.preRequistes];
        self.creditLabel.text = [NSString stringWithFormat:@"%@",self.course.credit];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
