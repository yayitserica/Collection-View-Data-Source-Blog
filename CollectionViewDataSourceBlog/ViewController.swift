//
//  ViewController.swift
//  CollectionViewDataSourceBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //?
    @IBOutlet var collectionView: UICollectionView!
    
    //?
    let store = DataStore.sharedInstance
    var images: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //?
        collectionView.dataSource = self
        //?
        collectionView.delegate = self
        
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
        cell.bookLabel.text = book.name
        cell.bookImage.image = store.images[indexPath.row]
        return cell
        
    }
}

