//
//  EventTypeViewController.swift
//  CustomCollectionView
//
//  Created by Domalwar, Pravin on 24/03/17.
//  Copyright © 2017 Domalwar, Pravin. All rights reserved.
//

import UIKit

class EventTypeViewController: UIViewController {

    @IBOutlet var mainCollectionView :CascadeCollectionView!

    lazy var eventTypeDataArray = [String]()

    fileprivate let sectionInsets = UIEdgeInsets(top:5, left:5.0, bottom:5.0, right:5.0)
    
    fileprivate let section2Insets = UIEdgeInsets(top:50, left:20.0, bottom:50.0, right:20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainCollectionView.register(UINib.init(nibName: "RCRoundedInfoCell", bundle: nil), forCellWithReuseIdentifier: "rcRounded")
        
        self.eventTypeDataArray = EventTypeDataHelper.getEventType()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let nav = self.navigationController, nav.viewControllers[0] != self {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension EventTypeViewController : UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        // Show only header and dayselction cell
        if(section == 0) {
            return 1;
        }
        
        return self.eventTypeDataArray.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var currentCell :UICollectionViewCell?
        
        switch indexPath.section {
        case 0: // This is header  cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:kHeaderCellIdentifier,
                                                          for: indexPath) as! HeaderCollectionViewCell
            
            cell.cellTitle = EventTypeDataHelper.getEventTypeTitle()
            currentCell = cell;
            
            break;
            
        default:
            
            let index = indexPath.row
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rcRounded",
                                                          for: indexPath) as! RCRoundedInfoCell
            
            cell.infoLbl.text = self.eventTypeDataArray[index]
            

            currentCell = cell;

            break;
            
        }
        
        return currentCell!;
    }
    
}


extension EventTypeViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var heightPerItem:CGFloat
        switch indexPath.section {
        case 0:
            heightPerItem = 290.0
            
        default:
            return CGSize(width: cricelButtonSize, height: cricelButtonSize)
            
        }
        
        return CGSize(width: collectionView.bounds.size.width, height: heightPerItem)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if(section==0) {
            return  sectionInsets
        }
        
        return  section2Insets
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if(section==0) {
            return  sectionInsets.left
        }
        return section2Insets.left
    }
    
}
