//
//  ViewController.swift
//  seoulFoodMap
//
//  Created by HSH on 22/08/2019.
//  Copyright © 2019 Ajou University D2fault. All rights reserved.
//

import UIKit
import MapKit



class ViewController: UIViewController {


    @IBOutlet weak var webView: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewSetting()
        // Do any additional setup after loading the view.
    }
    
    func viewSetting() {
        webView.mapType = .standard
        webView.isZoomEnabled = true
    }
    
}

class MainMap {
    
}

