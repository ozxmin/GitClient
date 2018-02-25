//
//  SearchResults.swift
//  Git Client
//
//  Created by Ozx Vax on 2/22/18.
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
    var JSONDataRepos: Repos?
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text  else { return }
        if searchBar.text == "" { return }
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.JSONDataRepos = self?.gitHubAPI.fetchRepositories(for: query)
            DispatchQueue.main.async { self?.tableView.reloadData() }
        }
        
        searchBar.resignFirstResponder()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        let singleRepo = JSONDataRepos?.items[indexPath.row]
        print(indexPath.row)
       
        if let repoCell = cell as? UIRepoCells {
            repoCell.repoInfo = singleRepo
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let repositrycount = JSONDataRepos?.items.count { return repositrycount }
        else { return 0 }
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
