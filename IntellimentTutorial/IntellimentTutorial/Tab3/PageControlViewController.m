//
//  PageControlViewController.m
//  IntellimentTutorial
//
//  Created by Tamboli, Ashfaque on 02/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

#import "PageControlViewController.h"

@interface PageControlViewController ()
{
   
}

@end

@implementation PageControlViewController
@synthesize textView;
@synthesize myScrollView;
@synthesize pageControl;
@synthesize scrollViewImage;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Text View setting.
    textView.dataDetectorTypes = UIDataDetectorTypeAll;
    textView.editable = NO;
    
    
    //ScrollView & PageControl coding.
    myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(7, 306, 586, 237)];
    myScrollView.backgroundColor=[UIColor clearColor];
    myScrollView.delegate=self;
    myScrollView.pagingEnabled=YES;
    [myScrollView setContentSize:CGSizeMake(myScrollView.frame.size.width*3, myScrollView.frame.size.height)];
}


-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat viewWidth = scrollView.frame.size.width;
    // content offset - tells by how much the scroll view has scrolled.
    
    int pageNumber = floor((scrollView.contentOffset.x - viewWidth/50) / viewWidth) +1;
    
    pageControl.currentPage=pageNumber;
    
    switch (pageControl.currentPage) {
        case 0:
            [scrollViewImage setImage:[UIImage imageNamed:@"nature1.jpg"]];
            break;
        case 1:
            [scrollViewImage setImage:[UIImage imageNamed:@"nature2.jpg"]];
            break;
        case 2:
            [scrollViewImage setImage:[UIImage imageNamed:@"nature3.jpg"]];
            break;
        default:
            break;
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pageChanged:(id)sender {
    int pageNumber = (int)pageControl.currentPage;
    CGRect frame = myScrollView.frame;
    frame.origin.x = frame.size.width*pageNumber;
    frame.origin.y=0;
    
    [myScrollView scrollRectToVisible:frame animated:YES];
}



@end
