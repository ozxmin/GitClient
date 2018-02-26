//
//  RepoDetailViewController.swift
//  Git Client
//
//  Created by Ozx Vax on 2/25/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import UIKit

class RepoDetailViewController: UITableViewController {
    

    @IBOutlet weak var repoDescription: UITableViewCell!
    @IBOutlet weak var repoImageView: UIImageView!
    
    @IBOutlet weak var contributorsLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    
    var repoInfo: gitHubRepoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repoDescription.textLabel?.text = repoInfo?.description
        repoImageView.image = repoInfo?.imageRepo
        contributors()
//        contributorsLabel.text = String(describing: repoInfo?.contributors)
    }
    
    func contributors() {
//        var JSONLogin: [Login]
//        var JSONIssues: [Issues]
//        guard let contributorsData = try? Data(contentsOf: (repoInfo?.contributors)!) else { return }
//        guard let issuesData = try?  Data(contentsOf: (repoInfo?.issues)!) else { return }
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
//        do {
//            JSONLogin = try decoder.decode([Login].self, from: contributorsData)
//            JSONIssues = try decoder.decode([Issues].self, from: issuesData)
//            let logins = Array(JSONLogin.prefix(3))
//            let issues = Array(JSONIssues.prefix(3))
//            let contributors = logins.map({$0.login}).reduce(logins[0].login, {"\($0)\n\($1)"})
//            let titleIssues = issues.map({$0.title}).reduce(issues[0].title, {"\($0)\n\($1)"})
//            contributorsLabel.text = contributors
//            issuesLabel.text = titleIssues
//        }
//        catch DecodingError.typeMismatch(let type, let context) {print("error: \(type) context: \(context)") }
//        catch { print("Localized error: \(error.localizedDescription)") }
//
    }
}
