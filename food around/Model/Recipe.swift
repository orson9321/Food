//
//  Recipe.swift
//  food around
//
//  Created by Orson Lin on 12/26/23.
//

import Foundation

struct Recipe
{
   let name: String
   let image_names: [String]
   // when a Nation pin is clicked, all recipes of that nation will be pulled up
   // should be split into more fields, e.g. flavor profile, feelings
   let nation: String
   let description: [String]
   let ingredients: [Ingredient]
   let steps: [Step]
}
