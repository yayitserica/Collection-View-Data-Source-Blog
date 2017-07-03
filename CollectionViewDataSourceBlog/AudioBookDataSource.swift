//
//  AudioBookDataSource.swift
//  CollectionViewDataSourceBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

//?
import UIKit

//?
class AudioBookDataSource: NSObject, UICollectionViewDataSource {

    //?
    var audiobooks: [Audiobook] = []
    
    //MARK: - UICollectionViewDataSource Methods
    
    //?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return audiobooks.count
    }
    
    //?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //?
        let identifier = "collectionViewCell"
        
        //?
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        return cell
    }
}
