//
//  UnderRightViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "ExtrasViewController.h"

@interface ExtrasViewController()
@property (nonatomic, unsafe_unretained) CGFloat peekLeftAmount;
@property (nonatomic, strong) NSArray *InfoItems;
@end

@implementation ExtrasViewController
@synthesize peekLeftAmount;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.peekLeftAmount = 724.0f;
  [self.slidingViewController setAnchorLeftPeekAmount:self.peekLeftAmount];
  self.slidingViewController.underRightWidthLayout = ECVariableRevealWidth;
    {
        _InfoItems = [NSArray arrayWithObjects:@"Studiengang", @"Highlights",@"Curriculum",@"Fakten",@"Berufsfelder", nil];
        
        
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.InfoItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
        
        
    }
    cell.textLabel.text = [self.InfoItems objectAtIndex:indexPath.row];
    cell.backgroundColor =[UIColor colorWithRed:132.0/255 green:191.0/255 blue:74.0/255 alpha:1];
    /*
    if(indexPath.row == 0)
        
        cell.imageView.image = [UIImage imageNamed:@"WEB.jpeg"];
    
    if(indexPath.row == 1)
        cell.imageView.image = [UIImage imageNamed:@"boehm.png"];
     */
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *identifier;
    
    if(indexPath.row == 0){
    
        identifier = [NSString stringWithFormat:@"WEBTop"];
        
        UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = newTopViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            [self.slidingViewController resetTopView];
        }];

    }else{
    
    identifier = [NSString stringWithFormat:@"%@", [self.InfoItems objectAtIndex:indexPath.row]];
    
    UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
    }
}



@end
