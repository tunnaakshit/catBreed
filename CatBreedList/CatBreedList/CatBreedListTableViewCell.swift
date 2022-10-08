//
//  CatBreedListTableViewCell.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 08/10/22.
//

import UIKit

class CatBreedListTableViewCell: UITableViewCell {


    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catBreedName: UILabel!
    
    
    static let identifier = "CatBreedListTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CatBreedListTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.catImageView.contentMode = .scaleAspectFit
    }

    func configureCell(with breedName: String, imageUrl: String) {
        self.catBreedName.text = breedName
        self.catImageView.loadFrom(URLAddress: imageUrl)
    }
    
}

