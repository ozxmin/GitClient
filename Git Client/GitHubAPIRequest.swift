//
//  File.swift
//  Git Client
//
//  Created by Ozx Vax on 2/25/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import Foundation

class GitHubAPIRequest {
    private var language: String?
    private var pageNumber = 1
    private let baseURL = "https://api.github.com/search/repositories?q=language:"
    
    private var GitHubAPIURL: String {
        get {
            let query = language ?? ""
            let pagination = "&page=\(String(describing: self.pageNumber))&per_page=20"
            return baseURL+query+pagination
        }
    }
    
    private func fetchData() -> GitHubJSON? {
        var JSONData: GitHubJSON?
        let queryURL = URL(string: GitHubAPIURL)
        guard let APIData = try? Data(contentsOf: queryURL!) else { return nil }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do { JSONData = try decoder.decode(GitHubJSON.self, from: APIData) }
        catch DecodingError.typeMismatch(let type, let context) {print("error: \(type) context: \(context)") }
        catch { print("GitHubJSON Localized error: \(error.localizedDescription)") }
        return JSONData
    }
    
    func fetchRepositories(for language: String) -> GitHubJSON? {
        pageNumber = 1
        self.language = language
        let JSONRepositories = fetchData()
        return JSONRepositories
    }
    
    func fetchNextPage() -> GitHubJSON? {
        pageNumber = pageNumber + 1
        let JSONRepositories = fetchData()
        return JSONRepositories
    }
    
}
