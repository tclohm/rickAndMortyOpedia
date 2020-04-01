//
//  ViewController.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/29/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import UIKit
import Alamofire
import Lottie

let cellIdentifier = "dataCell"

class MainViewController: UIViewController {
  
  weak var coordinator: MainCoordinator?
  
  var searchBar: UISearchBar!
  var tableView: UITableView!
  
  var animationView = AnimationView()
  
  var nextURL: String = ""
  
  var characters: [Displayable] = []
  var cachedCharacters: [Character] = []
  var selectedItem: Displayable?
  
  var isFetching: Bool!

  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar = UISearchBar()
    tableView = UITableView()
    tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    searchBar.delegate = self
    tableView.delegate = self
    tableView.dataSource = self
    
    if(characters.isEmpty) { isFetching = true } else { isFetching = false }
    if (isFetching == true && characters.isEmpty) {
      setupAnimation()
      fetchCharacters()
    }
    
    setupUI()
  }
  
  func setupAnimation() {
    animationView.animation = Animation.named("410-lego-loader")
    animationView.frame = view.bounds
    animationView.contentMode = .scaleAspectFit
    animationView.loopMode = .loop
    animationView.play()
    view.addSubview(animationView)
  }
  
  func setupUI() {
    self.view.addSubview(searchBar)
    self.view.addSubview(tableView)
    
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    searchBar.heightAnchor.constraint(equalToConstant: 55).isActive = true
    
    tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    
    searchBar.placeholder = "Find your favorite characters"
  }
  
  func search(for name: String) {
    let baseURL = "https://rickandmortyapi.com/api/character"
    let parameters: [String: String] = ["name": name]
    
    AF.request(baseURL, parameters: parameters)
      .validate()
      .responseDecodable(of: Characters.self) { response in
        guard let characters = response.value else { return }
        self.characters = characters.all
        self.animationView.stop()
        self.animationView.removeFromSuperview()
        self.tableView.reloadData()
    }
  }
}

extension MainViewController: Storyboarded {
  static func instantiate() -> Self {
    let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
    return sb.instantiateInitialViewController() as! Self
  }
}

extension MainViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.characters.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MainTableViewCell
    let character = characters[indexPath.item]
    let imageUrl: URL? = URL(string: character.characterImage)
    let data: NSData? = NSData(contentsOf: imageUrl!)
    let image = UIImage(data: data! as Data)
    
    cell.imageView?.image = image
    
    cell.name.text = character.characterName
    
    switch character.characterStatus {
    case "Alive" :
      cell.status.text = "👌 \(character.characterStatus)"
    case "Dead" :
      cell.status.text = "💀 \(character.characterStatus)"
    default:
      cell.status.text = "🤷‍♂️ \(character.characterStatus)"
    }
    
    return cell
  }
}

extension MainViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
  }
  
  func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    selectedItem = characters[indexPath.row]
    coordinator?.goToDetailWith(selectedItem!)
    return indexPath
  }
  
  
  
}

extension MainViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let characterName = searchBar.text else { return }
    setupAnimation()
    search(for: characterName)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = nil
    searchBar.resignFirstResponder()
    characters = cachedCharacters
    tableView.reloadData()
  }
}

extension MainViewController {
  func fetchCharacters() {
    AF.request("https://rickandmortyapi.com/api/character")
      .validate()
      .responseDecodable(of: Characters.self) { (response) in
      guard let chars = response.value else { return }
        self.cachedCharacters = chars.all
        self.characters = chars.all
        self.nextURL = chars.info.next
        self.isFetching = false
        self.animationView.stop()
        self.animationView.removeFromSuperview()
        self.tableView.reloadData()
    }
  }
}
