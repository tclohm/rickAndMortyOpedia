//
//  Place.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import Foundation

struct Place: Decodable {
  let name: String
  let url: String
  
  enum CodingKeys: String, CodingKey {
    case name
    case url
  }
}
