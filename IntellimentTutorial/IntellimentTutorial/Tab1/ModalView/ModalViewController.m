//
//  ModalViewController.m
//  IntellimentTutorial
//
//  Created by Tamboli, Ashfaque on 02/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController
@synthesize  lblCandidateName;
@synthesize lblDesignation;
@synthesize lblEmail;
@synthesize lblPhoneNo;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self userDetails];
    
    
}

-(void) userDetails
{
    [self.lblCandidateName setText:@"Ashfaque Tamboli"];
    [self.lblDesignation   setText:@"Team Lead"];
    [self.lblEmail setText:@"ashfaque21@gmail.com"];
    [self.lblPhoneNo setText:@"09762478745"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelAction:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
