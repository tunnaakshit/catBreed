//
//  CatBreedDescriptionVC.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 08/10/22.
//

import Foundation
import UIKit


class CatBreedDescriptionVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catBreed: UILabel!
    @IBOutlet weak var catBreedDescription: UILabel!
    
    
    // MARK: - Variables
    var catbreedDescriptionModel: CatBreedDescriptionModel?
    
    
    // MARK: - LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.catImageView.makeRounded()
        self.configureUI()
    }
    
    // MARK: - Additional Functions
    private func configureUI() {
        self.catImageView.image = UIImage(named: CatBreedCellConstants.catPlaceholderImage)
        if let url = self.catbreedDescriptionModel?.image?.url {
            self.catImageView.loadUrl(url)
        }
        
        self.catBreed.text = catbreedDescriptionModel?.name
        self.catBreedDescription.text = catbreedDescriptionModel?.description
    }
    
    // MARK: - Actions
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
