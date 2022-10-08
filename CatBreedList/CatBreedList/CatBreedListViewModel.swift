//
//  CatBreedListViewModel.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 08/10/22.
//

import Foundation

class CatBreedListViewModel {
    
    var catBreedModel: CatBreedModel?
    var onSuccess: ((_ catBreedList: [CatBreedListModel]) -> Void)?
    var onFailure: ((_ error: Error) -> Void)?
    
    
    
    
    func callApi() {
        
        NetworkManager.sharedInstance.executeNetworkRequest(url: "https://api.thecatapi.com/v1/breeds", method: .get, params: nil) { (result: Result<CatBreedModel, Error>) in
            switch result {
            case .success(let res):
                self.catBreedModel = res
                let catBreedList: [CatBreedListModel] = res.map { model in
                    return CatBreedListModel(model)
                }
                self.onSuccess?(catBreedList)
                print(res)
            case .failure(let err):
                self.onFailure?(err)
                print(err)
            }
        }
        
    }
}
