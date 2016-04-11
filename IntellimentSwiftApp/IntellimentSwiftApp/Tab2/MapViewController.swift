//
//  MapViewController.swift
//  IntellimentSwiftApp
//
//  Created by Tamboli, Ashfaque on 06/04/16.
//  Copyright © 2016 Tamboli, Ashfaque. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation


class MapPin: NSObject, MKAnnotation
    
{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String)
    {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}


class MapViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate
{
    var locationManager:CLLocationManager!
    var latitude_UserLocation = 0.0
    var longitude_UserLocation = 0.0
    var geocoder:CLGeocoder!
    var placemark:CLPlacemark!
    var locationStatus : NSString = "Not Started"
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.loadUserLocation()
        geocoder = CLGeocoder()
       
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    
    
    func loadUserLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager .requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func loadMapView()
    {
        let objCoordinate2D = CLLocationCoordinate2DMake(latitude_UserLocation, longitude_UserLocation)
        let objCoordinateSpan = MKCoordinateSpanMake(0.2, 0.2)
        let objMapRegion = MKCoordinateRegionMake(objCoordinate2D, objCoordinateSpan)
        mapView.setRegion(objMapRegion, animated: true)
    }

    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        locationManager.stopUpdatingLocation()
        print(error)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let locationValue = locations as NSArray
        let locationObject = locationValue.lastObject as! CLLocation
        let coordinates = locationObject.coordinate
        
        latitude_UserLocation = coordinates.latitude
        longitude_UserLocation = coordinates.longitude
        locationManager .stopUpdatingLocation()
        
        geocoder.reverseGeocodeLocation(locationObject, completionHandler:
            {(placemarks, error)->Void in
            var placemark:CLPlacemark!
            
            if error == nil && placemarks!.count > 0
            {
                placemark = placemarks![0] as CLPlacemark
                
                var addressString : String = ""
               
                    if placemark.postalCode != nil
                    {
                        addressString = placemark.postalCode! + ", "
                    }
                    if placemark.subAdministrativeArea != nil
                    {
                        addressString = addressString + placemark.subAdministrativeArea! + ", "
                    }
                
                    if placemark.locality != nil
                    {
                        addressString = addressString + placemark.locality! + ", "
                    }
                    if placemark.country != nil
                    {
                        addressString = addressString + placemark.country!
                    }
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let point = MapPin(coordinate: coordinates, title: addressString, subtitle: "I m here")
                    self.mapView .addAnnotation(point)
                })
            }
        })
        self .loadMapView()
        
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        var shouldAllow = false
        
        switch status
        {
            case CLAuthorizationStatus.Restricted:
                locationStatus = "Restricted Access to location"
            case CLAuthorizationStatus.Denied:
                locationStatus = "User denied access to location"
            case CLAuthorizationStatus.NotDetermined:
                locationStatus = "Status not determined"
            default:
                locationStatus = "Allowed to location Access"
                shouldAllow = true
        }
        if (shouldAllow == true)
        {
            // Start location services
            locationManager.startUpdatingLocation()
        }
        else
        {
            NSLog("Denied access: \(locationStatus)")
        }
    }
}


