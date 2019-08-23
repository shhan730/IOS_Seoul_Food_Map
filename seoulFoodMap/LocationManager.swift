//
//  LocationManager.swift
//  seoulFoodMap
//
//  Created by HSH on 23/08/2019.
//  Copyright © 2019 Ajou University D2fault. All rights reserved.
//

import Foundation
import MapKit

class LocationManager {
    
    let locationManager = CLLocationManager()
    
    var currentLocation: CLLocation!
    
    // Requesting Location Access to User
    
    func enableLocationServices() {
        //locationManager.delegate
        
        switch CLLocationManager.authorizationStatus() {
            
        case .restricted, .denied, .authorizedWhenInUse, .notDetermined:
            requestLotation()
            break
            
        case .authorizedAlways:
            break
            
        @unknown default:
            fatalError("location access status error")
        }
    }
    
    func requestLotation() {
        locationManager.requestAlwaysAuthorization()
    }
    
    // Get Location Info
    
    func startReceivingSignificantLocationChanges() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedAlways {
            // User has not authorized access to location information.
            return
        }
        
        if !CLLocationManager.significantLocationChangeMonitoringAvailable() {
            // The service is not available.
            return
        }
        //locationManager.delegate = self
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last!
        
        currentLocation = lastLocation
    }
    
    
    
}
    

