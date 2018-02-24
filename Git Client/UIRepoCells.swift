//
//  UIRepoCells.swift
//  Git Client
//
//  Created by Ozx Vax on 2/23/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import UIKit

class UIRepoCells: UITableViewCell {

    @IBOutlet weak var RepoNameLabel: UILabel!
    
    var theRepo: Items? {
        didSet { updateUI() }
    }

    private func updateUI() {
        
        RepoNameLabel.text = theRepo?.name
        print("Repo Name: \(String(describing: theRepo?.name))")
    }
}
