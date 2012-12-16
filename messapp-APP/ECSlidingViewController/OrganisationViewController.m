//
//  OrganisationViewController.m
//  messapp
//
//  Created by Florian Regente on 04.12.12.
//
//

#import "OrganisationViewController.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "ExtrasViewController.h"

@implementation OrganisationViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[StudiengaengeViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Studiengaenge"];
    }
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[ExtrasViewController class]]) {
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Extras"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealStudiengaenge:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)revealExtras:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECLeft];
}

@end
