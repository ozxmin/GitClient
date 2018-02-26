//
//  UIRepoCells.swift
//  Git Client
//
//  Created by Ozx Vax on 2/23/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import UIKit

class UIRepoCells: UITableViewCell {
    
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var repoImageView: UIImageView!
    
//
//    var cellData: infoRepo? { didSet { updateUI() } }
//
//    struct infoRepo {
//        var image: UIImage?
//        let name: String
//        let stars: Int
//        let description: String
//    }
    
    func updateUI(theRepo: gitHubRepoData) {
        repoNameLabel.text = theRepo.name
        starCountLabel.text = String(describing: theRepo.stars).appending(" ⭐️")
        descriptionLabel.text = theRepo.description
        repoImageView.image = theRepo.imageRepo
    }
}
