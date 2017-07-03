//
//  DataStore.swift
//  CollectionViewDataSourceBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation

final class DataStore {
    
    static let sharedInstance = DataStore()
    fileprivate init() {}
    
    var forecasts: [Audiobook] = []
    
    func getWeather(completion: @escaping () -> Void) {
        
        APIClient.getAudiobooksAPI { (json) in
            let feed = json["feed"] as? AudiobookJSON
            let results = feed["results"] as? [AudiobookJSON]
            
            let weeklyForecast = response?[0]
            let periodsArray = weeklyForecast?["periods"] as? [[String: Any]]
            
            if let unwrappedPeriodsArray = periodsArray {
                for dayDict in unwrappedPeriodsArray {
                    let newForecast = Forecast(dictionary: dayDict)
                    self.forecasts.append(newForecast)
                }
            }
            completion()
        }
        
    }
}
