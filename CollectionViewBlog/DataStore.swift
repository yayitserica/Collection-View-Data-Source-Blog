//
//  DataStore.swift
//  CollectionViewBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation
import UIKit

final class DataStore {
    
    static let sharedInstance = DataStore()
    fileprivate init() {}
    
    var audiobooks: [Audiobook] = []
    var images: [UIImage] = []

    func getBooks(completion: @escaping () -> Void) {
        
        APIClient.getAudiobooksAPI { (json) in
            let feed = json?["feed"] as? AudiobookJSON
            if let results = feed?["results"] as? [AudiobookJSON] {
                for dict in results {
                    let newAudiobook = Audiobook(dictionary: dict)
                    self.audiobooks.append(newAudiobook)
                }
                completion()
            }
        }
    }
    
    func getBookImages(completion: @escaping () -> Void) {
        getBooks { 
            for book in self.audiobooks {
                let url = URL(string: book.coverImage)
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self.images.append(image!)
                }
            }
            OperationQueue.main.addOperation {
                completion()
            }
        }
    }
}
