//
//  CollectionViewCell.swift
//  CollectionViewBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var bookImage: UIImageView!
    @IBOutlet var bookLabel: UILabel!
    
    func displayContent(image: UIImage, title: String) {
        bookImage.image = image
        bookLabel.text = title
    }
    
}
