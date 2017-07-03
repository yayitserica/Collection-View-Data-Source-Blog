//
//  Audiobook.swift
//  CollectionViewDataSourceBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation

struct Audiobook {
    let name: String
    let author: String
    let coverImage: String
    
    init(dictionary: AudiobookJSON) {
        self.name = dictionary["name"] as! String
        self.author = dictionary["artistName"] as! String
        self.coverImage = dictionary["artworkUrl100"] as! String
    }
    
}

extension Audiobook: Equatable {
    static func == (lhs: Audiobook, rhs: Audiobook) -> Bool {
        //two photos are the same if they have the same photoID
        return lhs.name == rhs.name
    }
}
