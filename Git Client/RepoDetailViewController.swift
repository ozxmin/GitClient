//
//  RepoDetailViewController.swift
//  Git Client
//
//  Created by Ozx Vax on 2/25/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import UIKit

class RepoDetailViewController: UIViewController {
    
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoImageView: UIImageView!
    
    var repoInfo: gitHubRepoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repoName.text = repoInfo?.name
        repoImageView.image = repoInfo?.imageRepo

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func updateUI(repo: gitHubRepoData) {
//        self.repoName.text = repo.name
//
//    }

    
    // MARK: - Navigation


        
    
    
    


}
