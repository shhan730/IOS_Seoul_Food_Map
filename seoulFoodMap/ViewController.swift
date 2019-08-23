//
//  ViewController.swift
//  seoulFoodMap
//
//  Created by HSH on 22/08/2019.
//  Copyright © 2019 Ajou University D2fault. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController {

    fileprivate let locationManager: CLLocationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        viewSetting()
//        locationManager.enableLocationServices()
        
        
    }
    
    func viewSetting() {
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isPitchEnabled = true
        
    }
    
    
}
