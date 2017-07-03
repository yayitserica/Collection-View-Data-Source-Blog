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
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var bookLabel: UILabel!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    //?
    func updateCell(with image: UIImage?) {
        if let displayImage = image {
            spinner.stopAnimating()
            spinner.hidesWhenStopped = true
            imageView.image = displayImage
        } else {
            spinner.startAnimating()
            imageView.image = nil
            
        }
    }
    
    //?
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCell(with: nil)
    }
    
    //?
    override func prepareForReuse() {
        super.prepareForReuse()
        updateCell(with: nil)
    }
    
}
