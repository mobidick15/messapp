//
//  MenuViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "MenuViewController.h"
#import "StgMainTopViewController.h"
#import "ExtrasViewController.h"

@interface MenuViewController()
@property (nonatomic, strong) NSArray *Bachelor;
@property (nonatomic, strong) NSArray *Bachalor_Sub;
@property (nonatomic, strong) NSArray *Master;
@property (nonatomic, strong) NSArray *Master_Sub;

@end

@implementation MenuViewController
@synthesize Bachelor;

- (void)awakeFromNib
{
      // Bachelor Titel
  self.Bachelor = [NSArray arrayWithObjects:@"WEB", @"SKVM", @"UF", nil];
    
    // Bacherlor Subtitel
  self.Bachalor_Sub = [NSArray arrayWithObjects:@"Web-Business & Technology",@"Sport-, Kultur- & Veranstaltungsmanagement", @"Unternehmensführung",@"", nil];
    
    // Master Titel
    self.Master = [NSArray arrayWithObjects:@"SKVM",@"IBS",nil];
    
    //Master Subtitel
    self.Master_Sub = [NSArray arrayWithObjects:@"Sport-, Kultur- & Veranstaltungsmanagement",@"International Business Studies", nil];
  
}
                       
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    NSString *returnString;
    
    if(section == 0){
    returnString = @"Bachelorstudiengänge";
    }
    if(section == 1){
    returnString = @"Masterstudiengänge";
    }
    return returnString;
    
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.slidingViewController setAnchorRightRevealAmount:380.0f];
  self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0){
  return self.Bachelor.count;
}
    if (sectionIndex == 1){
        return self.Master.count;
    }
    else{
        return 0;
    }
}
// Studiengänge Header eingeschaften
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   
    // Bachelor
    if (section == 0)
        {
        UIView *sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.sectionHeaderHeight)];
            sectionHeaderView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
            sectionHeaderView.userInteractionEnabled = YES;
            sectionHeaderView.tag = section;
    
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, 2, tableView.bounds.size.width-10, 16)];
            headerLabel.backgroundColor = [UIColor clearColor];
            headerLabel.textColor = [UIColor whiteColor];
            headerLabel.shadowColor = [UIColor darkGrayColor];
            headerLabel.shadowOffset = CGSizeMake(0, 1);
            headerLabel.font = [UIFont boldSystemFontOfSize:16];
            headerLabel.text = [NSString stringWithFormat:@"Bachelorstudiengänge"];
    
           [sectionHeaderView addSubview:headerLabel];
    
            return sectionHeaderView;
        }
    else
        // Master
        {
        UIView *sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.sectionHeaderHeight)];
            sectionHeaderView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
            sectionHeaderView.userInteractionEnabled = YES;
            sectionHeaderView.tag = section;
            
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -1, tableView.bounds.size.width, 23)];
            
            
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, 2, tableView.bounds.size.width-10, 18)];
            headerLabel.backgroundColor = [UIColor clearColor];
            headerLabel.textColor = [UIColor whiteColor];
            headerLabel.shadowColor = [UIColor darkGrayColor];
            headerLabel.shadowOffset = CGSizeMake(0, 1);
            headerLabel.font = [UIFont boldSystemFontOfSize:16];
            headerLabel.text = [NSString stringWithFormat:@"Masterstudiengänge"];
            
            [sectionHeaderView addSubview:backgroundImageView];
            [sectionHeaderView addSubview:headerLabel];
            
            return sectionHeaderView;
        }
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *cellIdentifier = @"MenuItemCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
      
      }
    if(indexPath.section == 0){
        

    cell.textLabel.text = [self.Bachelor objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.Bachalor_Sub objectAtIndex:indexPath.row];
        
        // Backgroundcolor  Grün
    cell.backgroundColor =[UIColor colorWithRed:132.0/255 green:191.0/255 blue:74.0/255 alpha:1];
   
        
        if(indexPath.row == 0)
            
            cell.imageView.image = [UIImage imageNamed:@"boehm.png"];
        
        
        if(indexPath.row == 1)
            
            cell.imageView.image = [UIImage imageNamed:@"SKVM.png"];
        
        if(indexPath.row ==2)
            
            cell.imageView.image = [UIImage imageNamed:@"UF.png"];
    
    }
    
    if (indexPath.section == 1){
        
    
    cell.textLabel.text = [self.Master objectAtIndex:indexPath.row];
    cell.detailTextLabel.text =[ self.Master_Sub objectAtIndex:indexPath.row];
    
        // BackgroundColor  Blau
    cell.backgroundColor =[UIColor colorWithRed:72.0/255 green:191.0/255 blue:215.0/255 alpha:1];
        
        if(indexPath.row == 0)
            
            cell.imageView.image = [UIImage imageNamed:@"SKVM.png"];
        
        
        if(indexPath.row == 1)
            
            cell.imageView.image = [UIImage imageNamed:@"IBS.png"];
        
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
 
    if(indexPath.section == 0){
        
        
    NSString *identifier = [NSString stringWithFormat:@"WEBTop"];
    NSString *ueberschrift = [NSString stringWithFormat:@"%@", [self.Bachalor_Sub objectAtIndex:indexPath.row]];
   
   StgMainTopViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
  
        if(newTopViewController.view){
            
            newTopViewController.MainBar.topItem.title = ueberschrift;
            
        }
     
        
  [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
    CGRect frame = self.slidingViewController.topViewController.view.frame;
    self.slidingViewController.topViewController = newTopViewController;
    self.slidingViewController.topViewController.view.frame = frame;
      self.slidingViewController.navigationItem.title = ueberschrift;
      NSLog(@"%@",ueberschrift);
      [self.slidingViewController resetTopView];
      
  }];
    }
    if(indexPath.section == 1){
        
        
        NSString *identifier = [NSString stringWithFormat:@"WEBTop"];
        NSString *ueberschrift = [NSString stringWithFormat:@"%@", [self.Master_Sub objectAtIndex:indexPath.row]];
        
        StgMainTopViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        
        if(newTopViewController.view){
        
            newTopViewController.MainBar.topItem.title = ueberschrift;
        
            
        
        }
        
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = newTopViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            self.slidingViewController.topViewController.navigationItem.title = ueberschrift;
            NSLog(@"%@",ueberschrift);
            [self.slidingViewController resetTopView];
            
        }];
    }
    }
        

@end
