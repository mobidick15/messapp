//
//  StgMainTopViewController.m
//  messapp
//
//  Created by Florian Regente on 09.12.12.
//
//

#import "StgMainTopViewController.h"

@implementation StgMainTopViewController

@synthesize MainBar = _MainBar;


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
    
    UITapGestureRecognizer *lable= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lableTaped:)];
    lable.numberOfTapsRequired = 1;
    [_mylable addGestureRecognizer:lable];
    _mylable.userInteractionEnabled = YES;
   
    
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)revealInfo:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECLeft];
}
-(void)lableTaped:(UITapGestureRecognizer *)sender
{
    
     NSString *identifier = [NSString stringWithFormat:@"Highlights"];   
    UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
       
       
        [self.slidingViewController resetTopView];
    }];
}
     


@end
