//
//  FaktenTopViewController.m
//  messapp
//
//  Created by Florian Regente on 10.12.12.
//
//

#import "FaktenTopViewController.h"

@interface FaktenTopViewController ()

@end

@implementation FaktenTopViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[ExtrasViewController class]]) {
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Extras"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}



- (IBAction)Info:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECLeft];
    
}

- (IBAction)Menu:(id)sender {
    
    [self.slidingViewController anchorTopViewTo:ECRight];
}
@end
