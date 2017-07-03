//
//  ViewController.swift
//  CollectionViewDataSourceBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    //?
    @IBOutlet var collectionView: UICollectionView!
    
    //?
    let bookDataSource = AudioBookDataSource()
    
    //?
    let store = DataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        //?
        collectionView.dataSource = bookDataSource
        //?
        collectionView.delegate = self

        store.getBooks { (retrievedBooks) in
            self.bookDataSource.audiobooks = retrievedBooks
            print(self.bookDataSource.audiobooks.count)
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let book = bookDataSource.audiobooks[indexPath.row]
        guard let photoIndex = self.bookDataSource.audiobooks.index(of: book) else { return }
        
        let bookIndexPath = IndexPath(item: photoIndex, section: 0)
        if let cell = self.collectionView.cellForItem(at: bookIndexPath) as? CollectionViewCell {
            cell.displayLabel(with: book.name)
        }
        self.collectionView.reloadSections(IndexSet(integer: 0))
    }


}

