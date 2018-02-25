//
//  GitHubRepo.swift
//  Git Client
//
//  Created by Ozx Vax on 2/23/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import Foundation

struct Repos: Codable {
    let total_count: Int
    let incomplete_results: Bool
    var items: [Items]
}

struct Items: Codable {
    let name: String?
    let stargazers_count: Int
    let description: String
    let owner: Owner?
}

struct Owner: Codable {
    let avatar_url: URL
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

