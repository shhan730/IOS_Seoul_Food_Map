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
    private var currentCordinate: CLLocationCoordinate2D?

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetting()
        configureLocationServices()
        
        
    }
    
    func configureLocationServices() {
        locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
        }else if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdate(locationManager: locationManager)
        }
    }
    
    private func zoomToLatestLocation(with cordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegion.init(center: cordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    private func beginLocationUpdate(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
    }
    
    func viewSetting() {
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isPitchEnabled = true
        
    }
    
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("did get latest location")
        
        guard let latestLocation = locations.first else { return }
        
        if currentCordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
        }
        
        currentCordinate = latestLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("status changed")
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdate(locationManager: manager)
            
        }
    }
    
}
