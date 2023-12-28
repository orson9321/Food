//
//  CountryPins.swift
//  food around
//
//  Created by Orson Lin on 12/7/23.
//

import Foundation
import MapKit

let london = Nation(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.", recipe_pin_ids: [])
let oslo = Nation(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.", recipe_pin_ids: [])
let paris = Nation(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.", recipe_pin_ids: [])
let rome = Nation(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.", recipe_pin_ids: [])
let washington = Nation(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.", recipe_pin_ids: [0, 1])

var nation_storage = [london, oslo, paris, rome, washington]
