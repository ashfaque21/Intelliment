//
//  CollectionViewController.swift
//  IntellimentSwiftApp
//
//  Created by Tamboli, Ashfaque on 07/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController
{
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//#pragma mark <UICollectionViewDataSource>
  
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 30
    }
    
    func imageLazyLoading(imageURL:NSURL, ForCustomCollectionViewCell cell:CustomCollectionViewCell)
    {
        
        let imageQueue:dispatch_queue_t = dispatch_queue_create("imageDownloader", nil)
        
        dispatch_async(imageQueue) { () -> Void in
            let imageData = NSData(contentsOfURL: imageURL)
            let image = UIImage(data: imageData!)
            
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                cell.activityIndicator.stopAnimating()
                let imageView = UIImageView(frame: CGRectMake(20, 20, 100, 100))
                imageView.image = image
                cell.imageView.image = imageView.image
            })
        }
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let url = NSURL(string: "https://placeholdit.imgix.net/~text?txtsize=15&txt=image1&w=120&h=120")
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        
        self.imageLazyLoading(url!, ForCustomCollectionViewCell: cell)
        
        return cell
        
    }
}
