//
//  BottomBarCollectionViewCell.swift
//  ECore
//
//  Created by Dushyant Varshney on 27/10/21.
//

import UIKit

class BottomBarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var underView: UIView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        underView.layer.cornerRadius = 1.5
        underView.layer.backgroundColor = UIColor.white.cgColor
    }
    
}
