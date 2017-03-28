//
//  RCRoundedInfoCell.swift
//  CustomCollectionView
//
//  Created by Domalwar, Pravin on 23/03/17.
//  Copyright © 2017 Domalwar, Pravin. All rights reserved.
//

import UIKit

class RCRoundedInfoCell: UICollectionViewCell {
    
    @IBOutlet weak var infoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = min(bounds.size.width,bounds.size.height) / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(netHex: 0x3636363).cgColor
        self.layer.masksToBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = min(bounds.size.width,bounds.size.height) / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(netHex: 0x3636363).cgColor
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var isSelected: Bool {
        didSet {
            // single selection
            backgroundColor = isSelected ? UIColor.init(netHex: 0x1F2BFF):UIColor.white
            //let fontSize = isSelected ? 22: 14
            infoLbl.textColor = isSelected ? UIColor.white:UIColor.black
            infoLbl.font = UIFont(name: infoLbl.font.fontName, size: CGFloat(22))
        }
    }
    
}
