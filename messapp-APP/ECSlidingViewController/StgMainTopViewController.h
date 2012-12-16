//
//  StgMainTopViewController.h
//  messapp
//
//  Created by Florian Regente on 09.12.12.
//
//
#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "ExtrasViewController.h"

@interface StgMainTopViewController : UIViewController
- (IBAction)Highlights:(id)sender;
- (IBAction)revealMenu:(id)sender;
- (IBAction)revealInfo:(id)sender;
@property (strong, nonatomic) IBOutlet UINavigationBar *MainBar;

@property (weak, nonatomic) IBOutlet UILabel *mylable;
@property (weak, nonatomic) IBOutlet UITextView *highlights;
@end



