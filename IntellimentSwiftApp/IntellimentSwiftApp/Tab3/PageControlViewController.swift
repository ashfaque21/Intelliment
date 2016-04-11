//
//  PageControlViewController.swift
//  IntellimentSwiftApp
//
//  Created by Tamboli, Ashfaque on 06/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

import Foundation
import UIKit


class PageControlViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var myScrollView: UIScrollView?
    @IBOutlet weak var pageControl: UIPageControl?
    @IBOutlet weak var scrollViewImage: UIImageView?
    
    
    override func viewDidLoad()
    {
        textView.dataDetectorTypes = UIDataDetectorTypes.All
        textView.editable = false
        
        myScrollView!.backgroundColor = UIColor.clearColor()
        myScrollView!.delegate = self
        myScrollView!.pagingEnabled = true
        myScrollView! .setContentOffset(CGPoint(x: myScrollView!.frame.size.width*3, y: myScrollView!.frame.size.height), animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let viewWidth:CGFloat = scrollView.frame.size.width
        let pageNumber:Int = (Int)(floor((scrollView.contentOffset.x - viewWidth/50) / viewWidth)) + 1
        pageControl!.currentPage = pageNumber
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func pageChanged(sender: AnyObject)
    {
        let pageNumber:Int = Int(pageControl!.currentPage)
        var frame:CGRect = myScrollView!.frame
        let page:CGFloat = CGFloat(pageNumber)
        frame.origin.x = frame.size.width*page
        frame.origin.y  = 0
        
        switch pageControl!.currentPage
        {
        case 0:
            self.scrollViewImage?.image = UIImage(named: "nature1.jpg")
        case 1:
            self.scrollViewImage?.image = UIImage(named: "nature2.jpg")
        case 2:
            self.scrollViewImage?.image = UIImage(named: "nature3.jpg")
        default:
            print("Issue in executing switch case.")
        }
        myScrollView!.scrollRectToVisible(frame, animated: true)
    }
    
    
    
}