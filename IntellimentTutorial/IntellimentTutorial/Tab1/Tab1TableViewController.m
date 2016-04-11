//
//  Tab1TableViewController.m
//  IntellimentTutorial
//
//  Created by Tamboli, Ashfaque on 02/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

#import "Tab1TableViewController.h"

@interface Tab1TableViewController ()

@end

@implementation Tab1TableViewController
@synthesize bulbImage;
@synthesize txtSelectedDate;
@synthesize datePicker;
@synthesize btnDatePicker;
@synthesize staticImageView;
@synthesize lblStaticSubTitle;
@synthesize lblStaticTitle;


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    datePicker.hidden = YES;
    [self unHideStaticImages];
}

- (IBAction)switchAction:(id)sender
{
    if (![sender isOn])
    {
        [bulbImage setImage:[UIImage imageNamed:@"checkbox-off-1-01-128.png"]];
    }
    else
    {
        [bulbImage setImage:[UIImage imageNamed:@"checkbox-on-1-01-128.png"]];
    }
}

- (IBAction)datePickerEvent:(id)sender
{
    [self hideStaticImages];
    datePicker.datePickerMode=UIDatePickerModeDate;
    datePicker.hidden=NO;
    [datePicker setMinimumDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    [datePicker setBackgroundColor:[UIColor purpleColor]];
}

-(void)dateChanged:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:datePicker.date]];
    //assign text to label
    txtSelectedDate.text=dateString;
    datePicker.hidden = YES;
    [self unHideStaticImages];
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    datePicker.hidden = YES;
    [self unHideStaticImages];
}

-(void) hideStaticImages
{
    staticImageView.hidden = TRUE;
    lblStaticTitle.hidden = TRUE;
    lblStaticSubTitle.hidden = TRUE;
}

-(void) unHideStaticImages
{
    staticImageView.hidden = FALSE;
    lblStaticTitle.hidden = FALSE;
    lblStaticSubTitle.hidden = FALSE;
}
@end
