//
//  Tab1TableViewController.swift
//  IntellimentSwiftApp
//
//  Created by Tamboli, Ashfaque on 06/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

import Foundation
import UIKit

class Tab1TableViewController: UITableViewController
{

    @IBOutlet weak var txtSelectedDate: UITextField!
    @IBOutlet weak var bulbImage: UIImageView!
    @IBOutlet weak var btnDatePicker: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker?
    @IBOutlet weak var switchAction: UISwitch!
    @IBOutlet weak var staticphotoImageView: UIImageView!
    @IBOutlet weak var lblStaticSubTitle: UILabel?
    @IBOutlet weak var lblStaticTitle: UILabel?
    override func viewDidLoad()
    {
            super.viewDidLoad()
            lblStaticTitle?.text = "Mr. Ashfaque Tamboli"
            lblStaticSubTitle?.text = "Tech Lead"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        datePicker!.hidden = true
        unHideStaticImages()
    }
    
    //UISwitch Handler
    @IBAction func switchAction(sender: AnyObject)
    {
        if(!(switchAction.on))
        {
                bulbImage.image = UIImage(named: "checkbox-off-1-01-128.png")
        }
        else
        {
            bulbImage.image = UIImage(named: "checkbox-on-1-01-128.png")
        }
    }
    
    //Date picker coding.
    @IBAction func datePickerEvent(sender: AnyObject)
    {
        hideStaticImages()
        datePicker!.hidden = false
        let currentDate = NSDate()
        if datePicker != nil
        {
            datePicker!.datePickerMode = UIDatePickerMode.Date
            datePicker!.hidden = false
            datePicker!.minimumDate = currentDate
            datePicker!.addTarget(self, action: "dateChanged", forControlEvents: UIControlEvents.ValueChanged)
            datePicker!.backgroundColor = UIColor.purpleColor()
        }
    }
    
    func dateChanged()
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.dateFormat = "MM/dd/YYYY"
        let dateString = dateFormatter.stringFromDate(datePicker!.date)
        txtSelectedDate.text = dateString
        datePicker!.hidden = true
        unHideStaticImages()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        super.touchesBegan(touches, withEvent: event)
        self.view .endEditing(true)
        datePicker!.hidden = true
        hideStaticImages()
    }
    
    
    //Unhide static images after date selection is over
    func unHideStaticImages()
    {
        staticphotoImageView.hidden = false
        lblStaticTitle!.hidden = false
        lblStaticSubTitle!.hidden = false
    }
    
    //Hide static images for date selection when date picker is clicked.
    func hideStaticImages()
    {
        if staticphotoImageView != nil
        {
            staticphotoImageView.hidden = true
        }
        if lblStaticTitle != nil
        {
            lblStaticTitle!.hidden = true
        }
        if lblStaticSubTitle != nil
        {
            lblStaticSubTitle!.hidden = true
        }
    }

    
}