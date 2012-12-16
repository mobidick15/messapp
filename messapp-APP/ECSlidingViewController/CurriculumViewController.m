//
//  CurriculumViewController.m
//  messapp
//
//  Created by Florian Regente on 09.12.12.
//
//

#import "CurriculumViewController.h"

@interface CurriculumViewController ()

@end

@implementation CurriculumViewController

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
    [self.slidingViewController anchorTopViewTo:ECRight
     ];
}

- (IBAction)doubleTap:(id)sender {
    
    if (self.scrollView.zoomScale != 1.0f)
    self.scrollView.zoomScale = 1.0f;
    else
    {
        self.scrollView.zoomScale = 2.0f;
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
