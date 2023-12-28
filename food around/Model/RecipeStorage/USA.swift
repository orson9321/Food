//
//  RecipeLocStorage.swift
//  food around
//
//  Created by Orson Lin on 12/28/23.
//

import Foundation
import MapKit

// these would be stored in the cloud; hence, a hard-coded id is fine
let burger = RecipeLoc(id: 0, title: "Burger", coordinate: CLLocationCoordinate2D(latitude: 38.891469827706025, longitude: -76.98100817008356), info: "generic burger.")

let hotdog = RecipeLoc(id: 1, title: "Hotdog", coordinate: CLLocationCoordinate2D(latitude: 38.885590729674654, longitude: -77.00821649673746), info: "famous hotdogs.")

// TODO: better file management. Split recipes from different countries into folders
// this should be an unordered map stored in the cloud
var recipe_storage: [Int : RecipeLoc] = [0:burger, 1:hotdog]
