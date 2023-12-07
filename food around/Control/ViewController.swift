//
//  ViewController.swift
//  food around
//
//  Created by Orson Lin on 12/6/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    // the map view
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCountryPins()
    }

    func loadCountryPins()
    {
        for idx in countryPins.indices {
            mapView.addAnnotation(countryPins[idx])
        }
    }
}

