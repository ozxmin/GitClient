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
    
    var repoInfo: Items? { didSet { updateUI() } }

    private func updateUI() {
        guard let theRepo = repoInfo else { return }
        repoNameLabel.text = theRepo.name
        starCountLabel.text = String(describing: theRepo.stargazers_count).appending(" ⭐️")
        descriptionLabel.text = theRepo.description
        let smallImageURL = URL(string: String(describing: theRepo.owner!.avatar_url).appending("&s=100"))!
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            var repoImage: UIImage?
            if let imageData = try? Data(contentsOf: smallImageURL) {
                repoImage = UIImage(data: imageData)
//                    print(repoImage!)
            }
            DispatchQueue.main.async {
                self?.repoImageView.image = repoImage
            }
        }
    }
}
