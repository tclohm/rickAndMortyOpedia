//
//  DetailViewController.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
  weak var coordinator: MainCoordinator?
  var data: Displayable?
  
  var imageView: UIImageView!
  var name: UILabel!
  var status: UILabel!
  var gender: UILabel!
  var location: UILabel!
  var origin: UILabel!
  var verticalStackView: UIStackView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    guard let data = data else { fatalError("data should be sent through") }
    setupUI()
    setupData(data)
  }
  
  func setupUI() {
    imageView = UIImageView()
    name = UILabel()
    status = UILabel()
    gender = UILabel()
    location = UILabel()
    origin = UILabel()
    verticalStackView = UIStackView(arrangedSubviews: [imageView, name, status, gender, location, origin])
    verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    verticalStackView.axis = .vertical
    verticalStackView.alignment = .center
    verticalStackView.distribution = .fillProportionally
    
    view.addSubview(verticalStackView)
    
    NSLayoutConstraint.activate([
      verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
  
  func setupData(_ data: Displayable) {
    let imageUrl: URL? = URL(string: data.characterImage)
    let imgdata: NSData? = NSData(contentsOf: imageUrl!)
    let image = UIImage(data: imgdata! as Data)
    imageView.image = image
    name.text = "name: \(data.characterName)"
    status.text = "status: \(data.characterStatus)"
    gender.text = "gender: \(data.characterGender)"
    location.text = "location: \(data.characterLocation)"
    origin.text = "origin: \(data.characterOrigin)"
  }
}

extension DetailViewController: Storyboarded {}
