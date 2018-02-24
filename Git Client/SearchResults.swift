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
   
    var repos: Repos?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let query = searchBar.text  else { return }
        if searchBar.text == "" { return }
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let myGitHub = URL(string:"https://api.github.com/search/repositories?q=language:\(query)&page=1&per_page=20")
//            let myGitHub = URL(string:"https://api.github.com/search/repositories?q=language:java&page=1&per_page=20")
            guard let URLContents = try? Data(contentsOf: myGitHub!) else { return }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                self?.repos = try decoder.decode(Repos.self, from: URLContents)
            } catch DecodingError.typeMismatch(let type, let context) {
                print("error:=================== \(type)")
                print("context:================= \(context)")
            } catch {
                print("error:==================== \(error.localizedDescription)")
            }
//            print("total_count: \(String(describing: self?.repos?.total_count))")
//            print("incomplete_results: \(String(describing: self?.repos?.incomplete_results))")
//            for each in (self?.repos?.items)! {
//                print("item: \(String(describing: each))")
//            }
            DispatchQueue.main.async {
//                print("main queue================")
//                let jsonObj = try? JSONSerialization.jsonObject(with: URLContents, options: [])
//                print(jsonObj.debugDescription)
                self?.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        let singleRepo = repos?.items[indexPath.row]
       
        if let repoCell = cell as? UIRepoCells {
            repoCell.theRepo = singleRepo
        }
        
//        cell.textLabel?.text = "Nombre: \(String(describing: repos!.items[indexPath.row].name))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let repositrycount = repos?.items.count {
            return repositrycount
        }
        return 0
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            repos.remove(at: indexPath.row)
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let cell = sender as? UITableViewCell,
//            let indexPath = tableView.indexPath(for: cell),
//            let platoDetail = segue.destination as? PlatoDetailViewController {
//            platoDetail.dataRow = indexPath.row
//        }
//    }

    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
