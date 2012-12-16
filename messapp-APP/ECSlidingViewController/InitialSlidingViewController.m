//
//  InitialSlidingViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/25/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "InitialSlidingViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface InitialSlidingViewController()

@property (strong, nonatomic) IBOutlet JSAnimatedImagesView *animatedImagesView;
//@property (strong, nonatomic) IBOutlet InitialSlidingViewController *infoBox;

@end

@implementation InitialSlidingViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    self.animatedImagesView.dataSource = self;
    //self.infoBox.layer.cornerRadius = 6;
  UIStoryboard *storyboard;
    
  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
  } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    storyboard = [UIStoryboard storyboardWithName:@"iPad" bundle:nil];
  }
  
  self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"WEBTop"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSUInteger)animatedImagesNumberOfImages:(JSAnimatedImagesView *)animatedImagesView
{
    return 3;
}

- (UIImage *)animatedImagesView:(JSAnimatedImagesView *)animatedImagesView imageAtIndex:(NSUInteger)index
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"image%d.jpg", index + 1]];
}


#ifdef __IPHONE_6_0
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
#endif





@end
