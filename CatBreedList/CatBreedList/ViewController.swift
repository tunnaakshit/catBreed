//
//  ViewController.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 06/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var catListTableView: UITableView!
    
    
    var catBreedListVM = CatBreedListViewModel()
    var dataSource: [CatBreedListModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        catListTableView.register(CatBreedListTableViewCell.nib(), forCellReuseIdentifier: CatBreedListTableViewCell.identifier)
        catListTableView.dataSource = self
        catListTableView.delegate = self
        
        self.bindUI()
        catBreedListVM.callApi()
    }
    
    func bindUI() {
        catBreedListVM.onSuccess = { [weak self] catBreedModels in
            self?.dataSource = catBreedModels
            self?.catListTableView.reloadData()
        }
        
        catBreedListVM.onFailure = { [weak self] err in
            print(err.localizedDescription)
            
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CatBreedListTableViewCell.identifier, for: indexPath) as? CatBreedListTableViewCell {
            cell.configureCell(with: self.dataSource[indexPath.row].name, imageUrl: self.dataSource[indexPath.row].image?.url ?? "")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

