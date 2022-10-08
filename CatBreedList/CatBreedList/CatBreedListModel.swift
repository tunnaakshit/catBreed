//
//  CatBreedListModel.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 08/10/22.
//

import Foundation

struct CatBreedListModel {
    let name: String
    let image: Image?
    
    init(_ model: CatBreed){
        self.name = model.name
        self.image = model.image
    }
   
}
