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
    
    // Set mapView region to nation-wide
    @IBAction func globeButtonTapped(_ sender: UIButton) {
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.13283999999996, longitude: -95.78558000000002), span: MKCoordinateSpan(latitudeDelta: 100.92150354710479, longitudeDelta: 61.276014999999944)), animated: true)
        loadNations()
    }
    
    
    func initialize()
    {
        mapView.delegate = self
        mapView.mapType = .mutedStandard
    }
    
    override func viewDidLoad() {
        print("view did load")
        
        super.viewDidLoad()
        // assign all delegates
        initialize()
        // load nation pins
        loadNations()
        // load recipe pins
        loadRecipeLocs()
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
    // Selecting a pin merely change the mapView region
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotationTitle = view.annotation?.title
        {
            if let nation = view.annotation! as? Nation {
                let recipe_pin_ids = nation.recipe_pin_ids
                // zoom to selected location
                let zoomed_region = MKCoordinateRegion(center: calcRecipeLocCenter(ids: recipe_pin_ids), latitudinalMeters: distance_span, longitudinalMeters: distance_span)
                mapView.setRegion(zoomed_region, animated: true)
            }
            else
            {
                print("recipe loc pin")
                // display recipe overlay
                
                // recipe list overlay
            }
        }
        
        // deselect pin
        view.isSelected = false
    }
    
    // Called when visible region changes. Hide or show pins depending on span
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
                if let nation = annotation as? Nation
                {
                    // prevent clustering to hide the nation pins. Doing this in viewDidLoad does not work for unknown reasons
                    mapView.view(for: annotation)?.displayPriority = .required
                    mapView.view(for: annotation)?.clusteringIdentifier = nil
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

