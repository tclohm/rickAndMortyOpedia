//
//  Character.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import Foundation

struct Character: Decodable {
  let id: Int
  let name: String
  let gender: String
  let image: String
  let location: Place
  let origin: Place
  let status: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case gender
    case image
    case location
    case origin
    case status
  }
}

extension Character: Displayable {
  var characterName: String {
    name
  }
  
  var characterImage: String {
    image
  }
  
  var characterStatus: String {
    status
  }
  
  var characterGender: String {
    gender
  }
  
  var characterLocation: String {
    location.name
  }
  
  var characterOrigin: String {
    origin.name
  }
}
