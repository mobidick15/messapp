//
//  maCollectionViewMainController.h
//  collView5
//
//  Created by Alexander Ries on 06.12.12.
//  Copyright (c) 2012 Alexander Ries. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <maCollectionViewController.h>
#import <maMainCell.h>

@interface maCollectionViewMainController : UICollectionViewController

@property (strong, nonatomic) NSMutableArray *cellImages;
@property (strong, nonatomic) NSMutableArray *cellText;

@end
