//
//  GitHubRepo.swift
//  Git Client
//
//  Created by Ozx Vax on 2/23/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import UIKit

struct GitHubJSON: Codable { var items: [RepoJSON] }
struct OwnerJSON: Codable { let avatar_url: URL }
struct Login: Codable { let login: String }
struct Issue: Codable { let title: String }

struct RepoJSON: Codable {
    let name: String
    let stargazers_count: Int
    let description: String
    let owner: OwnerJSON
    let issues_url: String
    let contributors_url: URL
}


class gitHubRepoData {
    var imageRepo: UIImage?
    let name: String
    let stars: Int
    let description: String
    var issues: URL?
    let contributors: URL?

    init(repoJSON: RepoJSON) {
        name = repoJSON.name
        stars = repoJSON.stargazers_count
        description = repoJSON.description
        contributors = repoJSON.contributors_url
        issues = fixIssuesURL(repoJSON.issues_url)
        getPicture(from: repoJSON.owner.avatar_url)

    }
    
    private func fixIssuesURL(_ url: String) -> URL? {
        let splitString = Array(url.split(separator: "{"))
        let urlComponents = splitString.map({String($0)})
        let issuesURL = URL(string: urlComponents[0])
        return issuesURL
    }
    
    private func getPicture(from picture: URL) {
        var repoImage: UIImage?
        if let imageData = try? Data(contentsOf: picture) {
            repoImage = UIImage(data: imageData)
        }
        self.imageRepo = repoImage
    }
}

