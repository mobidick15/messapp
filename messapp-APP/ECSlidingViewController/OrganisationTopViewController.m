//
//  SecondTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "OrganisationTopViewController.h"

@implementation OrganisationTopViewController

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  if (![self.slidingViewController.underLeftViewController isKindOfClass:[StudiengaengeViewController class]]) {
    self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Studiengaenge"];
  }
  self.slidingViewController.underRightViewController = nil;
  self.slidingViewController.anchorLeftPeekAmount     = 0;
  self.slidingViewController.anchorLeftRevealAmount   = 0;
  
  [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealStudiengaenge:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
