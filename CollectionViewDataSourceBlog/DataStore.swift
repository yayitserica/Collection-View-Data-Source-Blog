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

    func getBooks(completion: @escaping ([Audiobook]) -> Void) {
        var audiobooks: [Audiobook] = []
        APIClient.getAudiobooksAPI { (json) in
            let feed = json?["feed"] as? AudiobookJSON
            if let results = feed?["results"] as? [AudiobookJSON] {
                for dict in results {
                    let newAudiobook = Audiobook(dictionary: dict)
                    audiobooks.append(newAudiobook)
                }
                OperationQueue.main.addOperation {
                    completion(audiobooks)
                }
            }
            
        }
        
    }
}
