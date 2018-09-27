//
//  FlickrFeed.swift
//  FlickrExample
//
//  Created by Alper KARATAS on 9/27/18.
//  Copyright © 2018 Alper KARATAS. All rights reserved.
//

import Foundation

struct FlickrFeed: Codable {
    let title: String
    let link: String
    let description: String
    let modified: Date
    let generator: String
    let items: [Item]
}

struct Item: Codable {
    let title: String
    let link: String
    let media: Media
    let dateTaken: Date
    let description: String
    let published: Date
    let author, authorID, tags: String
    
    enum CodingKeys: String, CodingKey {
        case title, link, media
        case dateTaken = "date_taken"
        case description, published, author
        case authorID = "author_id"
        case tags
    }
}

struct Media: Codable {
    let m: String
}

