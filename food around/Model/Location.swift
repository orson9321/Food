//
//  Capital.swift
//  food around
//
//  Created by Orson Lin on 12/6/23.
//

import Foundation
import MapKit
import UIKit

class Location: NSObject, MKAnnotation {
    // for easier nation to recipe association
    let id: Int
    
    // required by MKAnnotation protocol
    let title: String?
    
    // short description
    let info: String

    // [longitude, latitude]
    let coordinate: CLLocationCoordinate2D
   
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.id = 0 // placeholder
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }

   // ctor that set id (for RecipeLoc)
    init(id: Int, title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.id = id
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
