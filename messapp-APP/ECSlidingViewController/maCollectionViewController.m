//
//  maCollectionViewController.m
//  collView5
//
//  Created by Alexander Ries on 06.12.12.
//  Copyright (c) 2012 Alexander Ries. All rights reserved.
//

#import "maCollectionViewController.h"
#import "maSTGCell.h"
#import "maCollectionViewMainController.h"
#import "InitialSlidingViewController.h"


@interface maCollectionViewController ()


@end

@implementation maCollectionViewController



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
	// Do any additional setup after loading the view.
    
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
    NSString *stg1 =@"Webbussiness & Technology";
    NSString *stg2 =@"Unternehmensführung";
    NSString *stg3 =@"Sport Kultur \nVeranstaltungsmanagement";
    NSString *stg4 =@"International \nBussiness Management";
    NSString *stg5 =@"Facility Management";
    NSString *stg6 =@"Marketing und Kommunikation";
    NSString *stg7 =@"Europäische Energiewirtschaft";
    NSString *stg8 =@"Wirtschaftsingenieurwesen";
    
    
    _cellImages = [@[@"WEB_pic.jpg",@"UF_pic.jpg",@"SKVM_pic.jpg",@"IW_pic.jpg",@"FM_pic.jpg",@"MK_pic.jpg",@"EE_pic.jpg",@"WING_pic.jpg",] mutableCopy];
    
    _cellText = [@[stg1,stg2,stg3,stg4,stg5,stg6, stg7, stg8] mutableCopy];
    
    float width;
    float onewidth;
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    onewidth = screenRect.size.height-240.0;
    
    width = onewidth/3.0;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(width, width)];
    [flowLayout setMinimumInteritemSpacing:60.0];
    [flowLayout setMinimumLineSpacing:60.0];
    
    UIEdgeInsets edgeinsets = UIEdgeInsetsMake(60.0, 60.0, 60.0, 60.0);
    flowLayout.sectionInset = edgeinsets;
    
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return _cellImages.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    maSTGCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"stgCell" forIndexPath:indexPath];
    
    UIImage *mainImage= [UIImage imageNamed:[_cellImages objectAtIndex:(NSUInteger)indexPath.item]];
    
    [myCell.stgImage setImage:mainImage];
    
    NSString *cellString = [_cellText objectAtIndex:(NSUInteger)indexPath.item];

    myCell.stgLabel.text = cellString;

    
    return myCell;
}

/*- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    
    int intVal = 20;
    CGFloat f = (CGFloat)intVal;
    
    return f;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float width;
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    width = screenRect.size.height/3.0-8.0;
    
    
    CGSize maxSize = CGSizeMake(width, width);
    
    return maxSize;
    
    float width;
    float onewidth;
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    onewidth = screenRect.size.height-80.0;
    
    width = onewidth/3.0;
    
    CGSize maxSize = CGSizeMake(width, width);
    return maxSize;
    
    
}*/

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.item == 0){
        
         InitialSlidingViewController *pushedcontroller = [self.storyboard instantiateViewControllerWithIdentifier:@"inc"];
        
        [self.navigationController pushViewController:pushedcontroller animated:YES];
    
    }
}

@end
