//
//  CurriculumViewController.h
//  messapp
//
//  Created by Florian Regente on 09.12.12.
//
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "ExtrasViewController.h"

@interface CurriculumViewController : UIViewController <UIScrollViewDelegate>
- (IBAction)Info:(id)sender;
- (IBAction)Menu:(id)sender;
- (IBAction)doubleTap:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
