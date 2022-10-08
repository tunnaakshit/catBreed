//
//  CatBreedListTableViewCell.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 08/10/22.
//

import UIKit

class CatBreedListTableViewCell: UITableViewCell {

    // MARK: - Outets
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catBreedName: UILabel!
    
    
    // MARK: - Variables
    static let identifier = "CatBreedListTableViewCell"
    
    
    // MARK: - LifeCycle Functionc
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.catImageView.contentMode = .scaleAspectFit
    }

    // MARK: - Additional Functions
    
    static func nib() -> UINib {
        return UINib(nibName: "CatBreedListTableViewCell", bundle: nil)
    }
    
    func configureCell(with breedName: String, imageUrl: String) {
        self.catBreedName.text = breedName
        self.catImageView.loadFrom(URLAddress: imageUrl)
    }
    
}

