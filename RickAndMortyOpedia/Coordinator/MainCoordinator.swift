//
//  MainCoordinator.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
  var children = [Coordinator]()
  var navigation: UINavigationController
  
  init(navigation: UINavigationController) {
    self.navigation = navigation
  }
  
  func start() {
    let mainvc = MainViewController.instantiate()
    mainvc.coordinator = self
    navigation.pushViewController(mainvc, animated: false)
  }
  
  func goToDetailWith(_ data: Displayable) {
    let vc = DetailViewController.instantiate()
    vc.data = data
    vc.coordinator = self
    navigation.pushViewController(vc, animated: true)
  }
}
