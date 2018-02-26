//
//  GitHubRepo.swift
//  Git Client
//
//  Created by Ozx Vax on 2/23/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import UIKit

struct GitHubJSON: Codable {
    var items: [RepoJSON]
}

struct RepoJSON: Codable {
    let name: String
    let stargazers_count: Int
    let description: String
    let owner: OwnerJSON
}

struct OwnerJSON: Codable {
    let avatar_url: URL
}

class gitHubRepoData {
    var imageRepo: UIImage?
    let name: String
    let stars: Int
    let description: String
    
    init(repoJSON: RepoJSON) {
        name = repoJSON.name
        stars = repoJSON.stargazers_count
        description = repoJSON.description
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

