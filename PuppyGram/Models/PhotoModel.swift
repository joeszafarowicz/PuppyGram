//
//  PhotoModel.swift
//  PuppyGram
//
//  Created by Joseph Szafarowicz on 11/9/22.
//

import Foundation

struct PhotoModel: Codable {
    let title: String
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case title, items
    }
}

struct Item: Codable {
    let title: String
    let media: Media
    let published: String
    let author: String

    enum CodingKeys: String, CodingKey {
        case title, media, published, author
    }
}

struct Media: Codable {
    let m: String
}

