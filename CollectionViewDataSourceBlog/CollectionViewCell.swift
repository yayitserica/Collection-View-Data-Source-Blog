//
//  CollectionViewCell.swift
//  CollectionViewDataSourceBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

//?
import UIKit

//?
class CollectionViewCell: UICollectionViewCell {
    
    //?
    @IBOutlet var bookLabel: UILabel!
    
    //?
    func displayLabel(with title: String) {
        bookLabel.text = title
    }
    
    
}
