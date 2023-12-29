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
    
    // TODO this shouldn't be a constant, should depends on recipe location/distribution
    let distance_span: CLLocationDistance = 5000

    func initialize()
    {
        mapView.delegate = self
        mapView.mapType = .mutedStandard
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // assign all delegates
        initialize()
        // load nation pins
        loadNations()
        
        
        //loadRecipeLocs()
    }
    
    // Load all nation pins
    func loadNations()
    {
        for idx in nation_storage.indices {
            mapView.addAnnotation(nation_storage[idx])
        }
    }
    
    func loadRecipeLocs()
    {
        for recipe_loc in recipe_storage {
            mapView.addAnnotation(recipe_loc.value)
        }
    }
    
    func loadRecipeLocs(ids: [Int])
    {
        for id in ids {
            mapView.addAnnotation(recipe_storage[id]!)
        }
    }
    
    // Calculate the center of the given recipe location
    func calcRecipeLocCenter(ids: [Int]) -> CLLocationCoordinate2D
    {
        var latitude_sum: Double = 0.0
        var longtitude_sum: Double = 0.0
        for id in ids {
            latitude_sum += recipe_storage[id]!.coordinate.latitude
            longtitude_sum += recipe_storage[id]!.coordinate.longitude
        }
        
        return CLLocationCoordinate2D(latitude: latitude_sum / Double(ids.count), longitude: longtitude_sum / Double(ids.count))
    }
    
    // Called when an annotation is selected.
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotation selected")
        if let annotationTitle = view.annotation?.title
        {
            if let nation = view.annotation! as? Nation {
                let recipe_pin_ids = nation.recipe_pin_ids
                // zoom to selected location
                let zoomed_region = MKCoordinateRegion(center: calcRecipeLocCenter(ids: recipe_pin_ids), latitudinalMeters: distance_span, longitudinalMeters: distance_span)
                mapView.setRegion(zoomed_region, animated: true)
                // display recipe pins
                
                // make a back button. When clicked, all recipe loc annotations get distroyed
                loadRecipeLocs(ids: recipe_pin_ids)
            }
            else
            {
                print("recipe loc pin")
                // display recipe overlay
                
                // add buttom bar
                
                // recipe list overlay
            }
        }
    }
    
    // called when visible region changes
    func mapView(
        _ mapView: MKMapView,
        regionDidChangeAnimated animated: Bool
    )
    {
        let annotations = mapView.annotations

            for annotation in annotations
            {
                if (mapView.region.span.latitudeDelta > 30)
                {
                    mapView.view(for: annotation)?.isHidden = true
                    
                    if let nation = annotation as? Nation
                    {
                        mapView.view(for: annotation)?.isHidden = false
                    }
                    else if let recipe_loc = annotation as? RecipeLoc
                    {
                        mapView.view(for: annotation)?.isHidden = true
                    }
                }
                else {
                    if let nation = annotation as? Nation
                    {
                        mapView.view(for: annotation)?.isHidden = true
                    }
                    else if let recipe_loc = annotation as? RecipeLoc
                    {
                        mapView.view(for: annotation)?.isHidden = false
                    }
                }
            }
    }
}

