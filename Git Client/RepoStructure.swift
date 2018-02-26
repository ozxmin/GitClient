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
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            var repoImage: UIImage?
            if let imageData = try? Data(contentsOf: picture) {
                repoImage = UIImage(data: imageData)
            }
            DispatchQueue.main.async { self?.imageRepo = repoImage }
        }
    }
}

//func fetchLanguageQuerry(language: String) {
//    var repos: Repos
//    DispatchQueue.global(qos: .userInitiated).async {
//        let myGitHub = URL(string:"https://api.github.com/search/repositories?q=language:\(language)&page=1&per_page=10")
//        guard let URLContents = try? Data(contentsOf: myGitHub!) else { return }
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
//        do {
//            repos = try decoder.decode(Repos.self, from: URLContents)
//        } catch DecodingError.typeMismatch(let type, let context) {
//            print("error:=================== \(type)")
//            print("context:================= \(context)")
//        } catch {
//            print("error:==================== \(error.localizedDescription)")
//        }
//        print("total_count: \(repos.total_count)")
//        print("incomplete_results: \(repos.incomplete_results)")
//        for each in repos.items {
//            print("item: \(each)")
//        }
//        DispatchQueue.main.async {
//            print("main queue================")
//            let jsonObj = try? JSONSerialization.jsonObject(with: URLContents, options: [])
//            print(jsonObj.debugDescription)
//
//            self?.tableView.reloadData()
//
//        }
//    }
//}

