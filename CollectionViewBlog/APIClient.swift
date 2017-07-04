//
//  APIClient.swift
//  CollectionViewBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation

typealias AudiobookJSON = [String: Any]

struct APIClient {
    
    static func getAudiobooksAPI(completion: @escaping (AudiobookJSON?) -> Void) {
        
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/10/explicit/json")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDAta, options: []) as? AudiobookJSON
                completion(responseJSON)
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}

