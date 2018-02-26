//
//  SearchResults.swift
//  Git Client
//
//  Created by Ozx Vax on 2/23/18.
//  Copyright © 2018 Ozx Vax. All rights reserved.
//

import UIKit

//https://api.github.com/user/repos?page=2&per_page=100

class SearchResults: UITableViewController, UISearchBarDelegate {
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    let gitHubAPI = GitHubAPIRequest()
    lazy var JSONDataRepos = [RepoJSON]()
    lazy var repos = [gitHubRepoData]()
    
    // MARK: - Search Function
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        repos.removeAll()
        guard let query = searchBar.text  else { return }
        if searchBar.text == "" { return }
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let jsonWraper = self?.gitHubAPI.fetchRepositories(for: query) else { return }
            for repo in jsonWraper.items { self?.repos.append(gitHubRepoData(repoJSON: repo)) }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        searchBar.resignFirstResponder()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        if let repoCell = cell as? UIRepoCells {
            repoCell.updateUI(theRepo: repos[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("========table count: \(repos.count)")
        return repos.count
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("items: \(indexPath.row), repos: \(repos.count) ")
        if indexPath.row == repos.count-2 {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                if let newRepos = self?.gitHubAPI.fetchNextPage()?.items {
                    for repo in newRepos { self?.repos.append(gitHubRepoData(repoJSON: repo)) }
                    print(newRepos)
                }
                DispatchQueue.main.async { self?.tableView.reloadData() }
            }
        }
    }
    
    
    
//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        let lastElement = dataSource.count - 1
//        if indexPath.row == lastElement {
//            // handle your logic here to get more items, add it to dataSource and reload tableview
//        }
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
