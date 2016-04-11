//
//  MapViewController.m
//  IntellimentTutorial
//
//  Created by Tamboli, Ashfaque on 02/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

#import "MapViewController.h"
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface MapViewController ()
{
    
}
@end

@implementation MapViewController

@synthesize mapView;
@synthesize locationManager;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadUserLocation];
    geocoder = [[CLGeocoder alloc] init];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.locationManager  startUpdatingLocation];
    [self.locationManager  startUpdatingHeading];
}

- (void) loadUserLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0)
{
    CLLocation *newLocation = [locations objectAtIndex:0];
    latitude_UserLocation = newLocation.coordinate.latitude;
    longitude_UserLocation = newLocation.coordinate.longitude;
    [self.locationManager stopUpdatingLocation];
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         
         if (error == nil && [placemarks count] > 0)
         {
             placemark = [placemarks lastObject];
             
             NSString *annotationValue = nil;
             
             if ([placemark.subThoroughfare length] != 0)
                 annotationValue = placemark.subThoroughfare;
             
             if ([placemark.thoroughfare length] != 0)
                 {
                     if ([annotationValue length] != 0)
                         annotationValue = [NSString stringWithFormat:@"%@, %@",annotationValue,[placemark thoroughfare]];
                     else
                     {
                         annotationValue = placemark.thoroughfare;
                     }
                 }
             
             if ([placemark.postalCode length] != 0)
                 {
                     if ([annotationValue length] != 0)
                         annotationValue = [NSString stringWithFormat:@"%@, %@",annotationValue,[placemark postalCode]];
                     else
                         annotationValue = placemark.postalCode;
                 }
             
             if ([placemark.locality length] != 0)
                 {
                     if ([annotationValue length] != 0)
                         annotationValue = [NSString stringWithFormat:@"%@, %@",annotationValue,[placemark locality]];
                     else
                         annotationValue = placemark.locality;
                 }
             
             if ([placemark.administrativeArea length] != 0)
                 {
                     if ([annotationValue length] != 0)
                         annotationValue = [NSString stringWithFormat:@"%@, %@",annotationValue,[placemark administrativeArea]];
                     else
                         annotationValue = placemark.administrativeArea;
                 }
             
             if ([placemark.country length] != 0)
                 {
                     if ([annotationValue length] != 0)
                         annotationValue = [NSString stringWithFormat:@"%@, %@",annotationValue,[placemark country]];
                     else
                         annotationValue = placemark.country;
                 }
             
             if (annotationValue.length>0)
                 {
                 dispatch_async(dispatch_get_main_queue(), ^{
                     // Add an annotation
                     MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                     point.coordinate = newLocation.coordinate;
                     point.title = annotationValue;
                     point.subtitle = @"I'm here!!!";
                     [self.mapView addAnnotation:point];
                     point = nil;
                 });
                 }
         }
     }];
    
    
    [self loadMapView];
    
}


- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [self.locationManager stopUpdatingLocation];
}

- (void) loadMapView
{
    CLLocationCoordinate2D objCoor2D = {.latitude = latitude_UserLocation, .longitude = longitude_UserLocation};
    MKCoordinateSpan objCoorSpan = {.latitudeDelta = 0.2, .longitudeDelta = 0.2};
    MKCoordinateRegion objMapRegion = {objCoor2D, objCoorSpan};
    [mapView setRegion:objMapRegion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showMessage:(NSString*)message withTitle:(NSString *)title
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}



@end
