//
//  PhotoModel.swift
//  CYGNVS-Interview-POC
//
//  Created by Ragul kts on 06/08/23.
//

import Foundation

// MARK: - Photo
struct Photo: Codable, Identifiable {
    let albumID, id: Int
    var title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias Photos = [Photo]
