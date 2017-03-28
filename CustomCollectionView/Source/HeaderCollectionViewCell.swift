//
//  HeaderCollectionViewCell.swift
//  CustomCollectionView
//
//  Created by Domalwar, Pravin on 23/03/17.
//  Copyright © 2017 Domalwar, Pravin. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet private weak var cellTitleLbl: UILabel!
    
    var cellTitle:String? {
        didSet {
            cellTitleLbl.text = cellTitle?.uppercased()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        // the layout keep on changing , hence the layer needs to get updared
        super.layoutSubviews()
    }
}
