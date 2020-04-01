//
//  Info.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import Foundation

struct Info: Decodable {
  let count: Int
  let next: String
  let pages: Int
  let prev: String
  
  enum CodingKeys: String, CodingKey {
    case count
    case next
    case pages
    case prev
  }
}
