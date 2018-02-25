//
//  File.swift
//  Git Client
//
//  Created by Ozx Vax on 2/25/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import Foundation

class GitHubAPIRequest {
    private let GitHubAPIURL = "https://api.github.com/search/repositories?q=language:"
    private var language: String?
    private var pageNumber = 1
    
    
    func fetchRepositories(for language: String) -> Repos? {
        var JSONData: Repos?
        let queryURL = URL(string: (self.GitHubAPIURL+language+"&page=\(String(describing: self.pageNumber))&per_page=20"))
        guard let APIData = try? Data(contentsOf: queryURL!) else { return nil }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do { JSONData = try decoder.decode(Repos.self, from: APIData) }
        catch DecodingError.typeMismatch(let type, let context) {print("error: \(type) context: \(context)") }
        catch { print("Localized error:==================== \(error.localizedDescription)") }
        
        return JSONData
    }
    
}
