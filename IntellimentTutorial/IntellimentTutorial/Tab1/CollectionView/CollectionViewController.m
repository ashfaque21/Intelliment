//
//  CollectionViewController.m
//  IntellimentTutorial
//
//  Created by Tamboli, Ashfaque on 02/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

#import "CollectionViewController.h"
#import "CustomCollectionViewCell.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

-(void) imageLazyLoading:(NSURL *) imageURL ForCustomCollectionViewCell:(CustomCollectionViewCell *) cell
{
    dispatch_queue_t imageQueue =  dispatch_queue_create("imageDownloader", nil);
    dispatch_async(imageQueue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.activityIndicator stopAnimating];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
            imageView.image = image;
            cell.imageCell.image = imageView.image;
        });
    });
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Create the request.
    NSURL *url = [NSURL URLWithString:@"https://placeholdit.imgix.net/~text?txtsize=15&txt=image1&w=120&h=120"];
    [self imageLazyLoading:url ForCustomCollectionViewCell:cell];
    return cell;
}





@end
