//
//  Storyboarded.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
  static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
  static func instantiate() -> Self {
    let identifier = String(describing: self)
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    return storyboard.instantiateViewController(identifier: identifier) as! Self
  }
}
