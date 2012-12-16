//
//  maCollectionViewMainController.m
//  collView5
//
//  Created by Alexander Ries on 06.12.12.
//  Copyright (c) 2012 Alexander Ries. All rights reserved.
//

#import "maCollectionViewMainController.h"
#import "maMainCell.h"
#import "maCollectionViewController.h"

@interface maCollectionViewMainController ()

@end

@implementation maCollectionViewMainController

@synthesize cellText = _cellText;

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

       
    NSString *stg1 =@"Bachelorstudiengänge";
    NSString *stg2 =@"Masterstudiengänge";
    NSString *stg3 =@"Über die Fachhochschule";
    
    
    
    _cellImages = [@[@"BA_pic.jpg",@"MA_pic.jpg",@"FH_pic.png",] mutableCopy];
    
    _cellText = [@[stg1,stg2,stg3,] mutableCopy];
    
    
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
    maMainCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mainCell" forIndexPath:indexPath];
    
    UIImage *mainImage= [UIImage imageNamed:[_cellImages objectAtIndex:(NSUInteger)indexPath.item]];
    
    [myCell.mainImage setImage:mainImage];
    
    
    NSString *cellString = [_cellText objectAtIndex:(NSUInteger)indexPath.item];
    
    myCell.mainLabel.text = cellString;
        
        
    return myCell;
}

/*- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    
    int intVal = 8;
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
}*/

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.item == 0){
    
     maCollectionViewController *pushedcontroller = [self.storyboard instantiateViewControllerWithIdentifier:@"stg"];
    
    [self.navigationController pushViewController:pushedcontroller animated:YES];
    }
    
    
}

@end
