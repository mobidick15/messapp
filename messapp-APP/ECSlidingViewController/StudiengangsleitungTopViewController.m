//
//  StudiengangsleitungTopViewController.m
//  messapp
//
//  Created by Florian Regente on 09.12.12.
//
//

#import "StudiengangsleitungTopViewController.h"

@interface StudiengangsleitungTopViewController ()

@end

@implementation StudiengangsleitungTopViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
        
        if (![self.slidingViewController.underRightViewController isKindOfClass:[ExtrasViewController class]]) {
            self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Extras"];
        }
        
        
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)revealInfo:(id)sender
{
    
    [self.slidingViewController anchorTopViewTo:ECLeft];
}



@end
