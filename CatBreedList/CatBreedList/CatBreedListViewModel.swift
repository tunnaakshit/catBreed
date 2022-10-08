//
//  CatBreedListViewModel.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 08/10/22.
//

import Foundation

class CatBreedListViewModel {
    
    // MARK: - Variables
    var catBreedModel: CatBreedModel?
    var carBreedDescriptionModels: [CatBreedDescriptionModel] = []
    var onSuccess: ((_ catBreedList: [CatBreedListModel]) -> Void)?
    var onFailure: ((_ error: Error) -> Void)?
    var loaderState: ((_ isShown: Bool) -> Void)?
    
    
    // MARK: - Additional Functions
    func fetchCatBreedsData() {
        self.loaderState?(true)
        
        NetworkManager.sharedInstance.executeNetworkRequest(url: "https://api.thecatapi.com/v1/breeds", method: .get, params: nil) { (result: Result<CatBreedModel, Error>) in
            switch result {
            case .success(let res):
                self.catBreedModel = res
                let catBreedList: [CatBreedListModel] = res.map { model in
                    return CatBreedListModel(model)
                }
                self.carBreedDescriptionModels = res.map({ model in
                    return CatBreedDescriptionModel(model)
                })
                self.onSuccess?(catBreedList)
                self.loaderState?(false)
                print(res)
            case .failure(let err):
                self.onFailure?(err)
                self.loaderState?(false)
                print(err)
            }
        }
        
    }
    
    func getCatBreedDescriptionData(_ index: Int) -> CatBreedDescriptionModel {
        return self.carBreedDescriptionModels[index]
    }
}
