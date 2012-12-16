//
//  ImageViewController.m
//  messapp
//
//  Created by Alexander Mösinger on 05.12.12.
//
//

#import "ImageViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ImageViewController ()

@property (strong, nonatomic) IBOutlet JSAnimatedImagesView *animatedImagesView;
@property (strong, nonatomic) IBOutlet UIView *infoBox;

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animatedImagesView.dataSource = self;
    
    self.infoBox.layer.cornerRadius = 6;
}

#pragma mark - JSAnimatedImagesViewDataSource Methods

- (NSUInteger)animatedImagesNumberOfImages:(JSAnimatedImagesView *)animatedImagesView
{
    return 3;
}

- (UIImage *)animatedImagesView:(JSAnimatedImagesView *)animatedImagesView imageAtIndex:(NSUInteger)index
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"image%d.jpg", index + 1]];
}

#pragma mark - UI

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//#ifdef __IPHONE_6_0
//- (NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskAllButUpsideDown;
//}
//#endif


@end
