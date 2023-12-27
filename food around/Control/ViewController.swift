//
//  ViewController.swift
//  food around
//
//  Created by Orson Lin on 12/6/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    // the map view
    @IBOutlet weak var mapView: MKMapView!
    
    func initialize()
    {
        mapView.delegate = self
        mapView.mapType = .mutedStandard
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // assign all delegates
        initialize()
        // load country pins
        loadCountryPins()
    }
    
    // load all country pins
    func loadCountryPins()
    {
        for idx in nation_storage.indices {
            mapView.addAnnotation(nation_storage[idx])
        }
    }
    
    // called when an annotation is selected
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotationTitle = view.annotation?.title
        {
            print("User tapped on annotation with title: \(annotationTitle!)")
            // zoom to a country
        }
    }
}

