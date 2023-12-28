//
//  File.swift
//  food around
//
//  Created by Orson Lin on 12/26/23.
//

import Foundation
import MapKit

class Nation: Location
{
  let recipe_pin_ids: [Int]
  init(title: String, coordinate: CLLocationCoordinate2D, info: String, recipe_pin_ids: [Int]) {
      self.recipe_pin_ids = recipe_pin_ids
      super.init(title: title, coordinate: coordinate, info: info)
  }
}
