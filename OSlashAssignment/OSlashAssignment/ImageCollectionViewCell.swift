//
//  ImageCollectionViewCell.swift
//  OSlashAssignment
//
//  Created by Luv on 31/10/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImageView.layer.cornerRadius = 10.0
    }
    
    override func prepareForReuse() {
        self.ImageView.image = nil
    }

    
    func setImage(image : UIImage){
        self.ImageView.image = image
    }
}
