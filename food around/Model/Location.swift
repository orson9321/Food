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
    
    let name: String
    // short description
    let info: String

    // [longitude, latitude]
    let coordinate: CLLocationCoordinate2D
   
    init(name: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.id = 0 // placeholder
        self.name = name
        self.coordinate = coordinate
        self.info = info
    }
}
