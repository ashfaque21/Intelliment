//
//  ModalViewController.swift
//  IntellimentSwiftApp
//
//  Created by Tamboli, Ashfaque on 06/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

import Foundation
import UIKit

let candidateName = "Ashfaque Tamboli"
let designation = "Team Lead"
let emailId = "ashfaque21@gmail.com"
let phoneNo = "09762478745"

class ModalViewController: UIViewController
{
    @IBOutlet weak var lblCandidateName: UILabel!
    @IBOutlet weak var lblPhoneNo: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblDesignation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userDetails()
    }
    
    func userDetails()
    {
        lblCandidateName.text = candidateName
        lblDesignation.text = designation
        lblEmail.text = emailId
        lblPhoneNo.text = phoneNo
    }
    
    @IBAction func cancelAction(sender: AnyObject)
    {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
}