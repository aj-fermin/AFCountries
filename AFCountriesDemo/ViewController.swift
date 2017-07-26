//
//  ViewController.swift
//  AFCountries-iOS
//
//  Created by Aj Fermin on 25/07/2017.
//  Copyright © 2017 Aj Fermin. All rights reserved.
//

import UIKit
import AFCountries

class ViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    struct AFCountryVCConstants {
        static let cellId   = "cellCountry"
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var viewSearchBarContainer: UIView!
    @IBOutlet weak var tableViewCountries: UITableView!
    
    private var allCountries = [AFCountry]()
    private var filteredCountries = [AFCountry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        viewSearchBarContainer.addSubview(searchController.searchBar)
        tableViewCountries.tableFooterView = UIView()
        
        allCountries = AFCountry.allCountriesWithCodes()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredCountries.count
        }
        
        return allCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCountries.dequeueReusableCell(withIdentifier: AFCountryVCConstants.cellId, for: indexPath)
        
        var country: AFCountry
        if searchController.isActive && searchController.searchBar.text != "" {
            country = filteredCountries[indexPath.row]
        }
        else {
            country = allCountries[indexPath.row]
        }
        
        cell.textLabel?.text = "\(country.flagEmoji) [\(country.countryCode)] \(country.countryName) (+\(country.dialCode))"
        
        return cell
    }
    
    // MARK: - Search Results -
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredCountries = allCountries.filter { country in
            return country.countryName.lowercased().contains(searchText.lowercased())
        }
        
        tableViewCountries.reloadData()
    }
    
    // MARK: - Search Bar -
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterContentForSearchText(searchText: searchBar.text!)
    }
    
    
}

