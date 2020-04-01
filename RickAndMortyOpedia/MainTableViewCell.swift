//
//  MainTableViewCell.swift
//  RickAndMortyOpedia
//
//  Created by Taylor Lohman on 3/30/20.
//  Copyright © 2020 Taylor Lohman. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
  
  var pictureView: UIImageView!
  var name: UILabel!
  var status: UILabel!
  
  var vertStack: UIStackView!
  var horizStack: UIStackView!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
    //fatalError("init(coder:) has not been implemented")
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
  
  func setupUI() {
    horizStack = UIStackView()
    vertStack = UIStackView()
    pictureView = UIImageView()
    name = UILabel()
    status = UILabel()
    status.font = UIFont(name: "MeltdownMF", size: 15)
    
    vertStack.addArrangedSubview(name)
    vertStack.addArrangedSubview(status)
    vertStack.axis = .vertical
    vertStack.alignment = .leading
    
    self.addSubview(horizStack)
    horizStack.addArrangedSubview(pictureView)
    horizStack.addArrangedSubview(vertStack)
    horizStack.axis = .horizontal
    horizStack.alignment = .center
    horizStack.spacing = 130
    
    horizStack.translatesAutoresizingMaskIntoConstraints = false
    vertStack.translatesAutoresizingMaskIntoConstraints = false
    
    horizStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    horizStack.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
    horizStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
  }

}
