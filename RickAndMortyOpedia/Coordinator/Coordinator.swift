//
//  Coordinator.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
  var children: [Coordinator] { get set }
  var navigation: UINavigationController { get set }
  func start()
}
