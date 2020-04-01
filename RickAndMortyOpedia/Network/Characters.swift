//
//  Characters.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import Foundation

struct Characters: Decodable {
  let info: Info
  let all: [Character]
  
  enum CodingKeys: String, CodingKey {
    case info
    case all = "results"
  }
}
