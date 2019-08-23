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
    
    func enableLocationServices() {
        //locationManager.delegate
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            requestLoation()
            break
            
        case .restricted, .denied:
            requestLoation()
            break
            
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            break
            
        case .authorizedAlways:
            break
            
        @unknown default:
            fatalError("location access status error")
        }
    }
    
    func requestLoation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
}
    

