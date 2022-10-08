//
//  CatBreedModel.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 08/10/22.
//

import Foundation

typealias CatBreedModel = [CatBreed]

// MARK: - CatBreed
struct CatBreed: Codable {
    let id, name: String
    let description: String
    let image: Image?

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case image
    }
}

// MARK: - Image
struct Image: Codable {
    let id: String
    let width, height: Int
    let url: String
}
