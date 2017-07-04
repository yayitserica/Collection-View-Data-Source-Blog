//
//  ViewController.swift
//  CollectionViewBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let store = DataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.getBookImages { 
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.audiobooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        let book = store.audiobooks[indexPath.row]
        
        cell.displayContent(image: store.images[indexPath.row], title: book.name)

        return cell
        
    }
}

