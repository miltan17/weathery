//
//  CurrentWeatherViewController.swift
//  Weathery
//
//  Created by Miltan on 11/15/17.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    @IBOutlet weak var currentTemperature: UILabel!
    @IBOutlet weak var location: UILabel!

    let forecastService = ForecastService()
    
    var locationSearchController: UISearchController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTableViewController
        locationSearchController = UISearchController(searchResultsController: locationSearchTable)
        locationSearchController?.searchResultsUpdater = locationSearchTable
        
        
        //set search bar
        let searchBar = locationSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = locationSearchController?.searchBar
        
        locationSearchController?.hidesNavigationBarDuringPresentation = false
        locationSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        locationSearchTable.handleLocationSearchDelegate = self
    }
}

extension CurrentWeatherViewController: HandleLocationSearch{
    func getWeatherFor(location: String, latitude: Double, longitude: Double) {
        print(latitude)
        print(longitude)
        
        forecastService.getForecast(latitude: latitude, longitude: longitude) { (currentWeather) in
            
            if let currentWeather = currentWeather{
                
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature{
                        self.currentTemperature.text = String(temperature)
                        self.location.text = location
                    }
                }
            }
        }
    }
}
