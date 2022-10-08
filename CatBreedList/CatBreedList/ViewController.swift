//
//  ViewController.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 06/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var catBreedListVM = CatBreedListViewModel()
    var dataSource: [CatBreedListModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.bindUI()
        catBreedListVM.callApi()
    }
    
    func bindUI() {
        catBreedListVM.onSuccess = { [weak self] catBreedModels in
            self?.dataSource = catBreedModels
        }
        
        catBreedListVM.onFailure = { [weak self] err in
            print(err.localizedDescription)
            
        }
    }


}

