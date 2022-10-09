//
//  CatBreedDescriptionModel.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 09/10/22.
//

import Foundation

struct CatBreedDescriptionModel {
    let name, description: String
    let image: Image?
    
    init(_ model: CatBreed) {
        self.name = model.name
        self.description = model.description
        self.image = model.image
    }
}
