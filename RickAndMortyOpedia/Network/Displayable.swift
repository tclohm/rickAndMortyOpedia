//
//  Displayable.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

protocol Displayable {
  var characterName: String { get }
  var characterImage: String { get }
  var characterStatus: String { get }
  var characterGender: String { get }
  var characterLocation: String { get }
  var characterOrigin: String { get }
}
