//
//  CascadeCollectionViewCell.swift
//  CustomCollectionView
//
//  Created by Domalwar, Pravin on 23/03/17.
//  Copyright © 2017 Domalwar, Pravin. All rights reserved.
//

import UIKit


class CascadeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var cellTitleLbl: UILabel!

    //Sub-collectionview
    @IBOutlet weak var collectionView: UICollectionView!

    var dataSource:[String]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var cellTitle:String? {
        didSet {
            cellTitleLbl.text = cellTitle
        }
    }
    // set the reservation type
    var bookingType : EventBookingRows?

    // keep the selected indexpath
    internal var selectedIndexPath :IndexPath?
    
    //Selected Option Index
    var selectedOptionIndex:((_ index:Int, _ type:EventBookingRows) ->Void)?

    fileprivate let sectionInsets = UIEdgeInsets(top:1.0, left:1.0, bottom:1.0, right:1.0)
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.register(UINib.init(nibName: "RCRoundedInfoCell", bundle: nil), forCellWithReuseIdentifier: "rcRounded")
        self.collectionView.reloadData()
    }
}

extension CascadeCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegate {
    
    //1
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if let data = dataSource {
            return data.count
        }
        return 0
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rcRounded",
                                                      for: indexPath) as! RCRoundedInfoCell
        
        cell.infoLbl.text = dataSource![indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        if let _ = collectionView.cellForItem(at: indexPath)as? RCRoundedInfoCell
        {
            self.selectedIndexPath = indexPath
            self.selectedOptionIndex?(indexPath.row,bookingType!)
            collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    override func prepareForReuse() {
        // Remove selection
        if let indexpath = self.selectedIndexPath {
            self.collectionView.deselectItem(at: indexpath, animated: true)
        }
        self.selectedIndexPath = nil
        // Invalide layout
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension CascadeCollectionViewCell : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        /*
        if let selIndexPath = selectedIndexPath, selIndexPath == indexPath  {
            return CGSize(width: 82, height: 82)
        } */
        return CGSize(width: cricelButtonSize, height: cricelButtonSize)
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
