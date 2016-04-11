//
//  Tab1TableViewController.h
//  IntellimentTutorial
//
//  
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tab1TableViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *txtSelectedDate;
@property (weak, nonatomic) IBOutlet UIImageView *bulbImage;
@property (weak, nonatomic) IBOutlet UIButton *btnDatePicker;
@property (weak, nonatomic) IBOutlet UIImageView *staticImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblStaticSubTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblStaticTitle;

@end
