//
//  Ingredient.swift
//  food around
//
//  Created by Orson Lin on 12/26/23.
//

import Foundation

struct Ingredient
{
   let name: String
   // Optional bc common ingredients do not have fun facts
   let facts: [String]!
   // Optional bc may or may not have one
   let affiliate_link: String!
}
