//
//  MapViewController.h
//  IntellimentTutorial
//
//  Created by Tamboli, Ashfaque on 02/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface MapViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate>
{
    CLLocationManager *locationManager;
    double latitude_UserLocation, longitude_UserLocation;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}
@property (strong, nonatomic)CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
