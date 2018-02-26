//
//  GitHubRepo.swift
//  Git Client
//
//  Created by Ozx Vax on 2/23/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import UIKit


//Nombre, imagen y descripción del repo. Una lista con los 3 últimos issues reportados y una lista con los 3 usuarios que más han contribuido al repo.

struct GitHubJSON: Codable {
    var items: [RepoJSON]
}

struct RepoJSON: Codable {
    let name: String
    let stargazers_count: Int
    let description: String
    let owner: OwnerJSON
//    let issues_url: URL
//    let contributors_url: URL
}

struct OwnerJSON: Codable {
    let avatar_url: URL
}

struct Login: Codable {
    let login: URL
}

struct Issues: Codable {
    let title: URL
}



class gitHubRepoData {
    var imageRepo: UIImage?
    let name: String
    let stars: Int
    let description: String
//    let issues: URL
//    let contributors: URL

    
    init(repoJSON: RepoJSON) {
        name = repoJSON.name
        stars = repoJSON.stargazers_count
        description = repoJSON.description
//        issues = repoJSON.issues_url
//        contributors = repoJSON.contributors_url
        getPicture(from: repoJSON.owner.avatar_url)
    }
    
    private func getPicture(from picture: URL) {
            var repoImage: UIImage?
            if let imageData = try? Data(contentsOf: picture) {
                repoImage = UIImage(data: imageData)
            }
        self.imageRepo = repoImage
    }
}

