//
//  CustomCollectionViewCell.h
//  IntellimentTutorial
//
//  Created by Tamboli, Ashfaque on 05/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageCell;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
