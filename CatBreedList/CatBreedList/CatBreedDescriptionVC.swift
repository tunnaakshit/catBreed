//
//  CatBreedDescriptionVC.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 08/10/22.
//

import Foundation
import UIKit


class CatBreedDescriptionVC: UIViewController {
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catBreed: UILabel!
    @IBOutlet weak var catBreedDescription: UILabel!
    
    var catbreedDescriptionModel: CatBreedDescriptionModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.catImageView.loadFrom(URLAddress: catbreedDescriptionModel?.image?.url ?? "")
        self.catBreed.text = catbreedDescriptionModel?.name
        self.catBreedDescription.text = catbreedDescriptionModel?.description
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
