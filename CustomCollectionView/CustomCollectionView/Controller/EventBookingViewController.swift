//
//  EventBookingViewController.swift
//  CustomCollectionView
//
//  Created by Domalwar, Pravin on 23/03/17.
//  Copyright © 2017 Domalwar, Pravin. All rights reserved.
//

import UIKit

let kHeaderCellIdentifier = "cascadeHeaderCellIdentifier"
let kDetailCellIdentifier = "cascadeDetailCellIdentifier"


class EventBookingViewController: UIViewController {

    @IBOutlet var mainCollectionView :CascadeCollectionView!
    @IBOutlet var continueButton :UIButton!

    fileprivate let sectionInsets = UIEdgeInsets(top:5, left:5.0, bottom:5.0, right:5.0)

    var selectedReservationData = [EventBookingRows:IndexPath]()
    
    lazy var reservationDataArray = [EventBookingRows:[String]]()
    
    fileprivate lazy var bookingDateArray = [String]()
    
//    fileprivate let sectionInsets = UIEdgeInsets(top:5, left:0.0, bottom:5.0, right:0.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true;
        
        self.initializeReservationData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func initializeReservationData() {
        
        reservationDataArray[EventBookingRows.bookingDay] = EventBookingDataHelper.getEventDay()
        reservationDataArray[EventBookingRows.bookingTime] = EventBookingDataHelper.getTimeArraybasedOn(date: Date());
        reservationDataArray[EventBookingRows.duration] = EventBookingDataHelper.getEventDuration()
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

    // In a storyboard-based application, you will often want to do a little 
     // preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EventBookingViewController : UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        // Show only header and dayselction cell
        return EventBookingRows.allValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var currentCell :UICollectionViewCell?
        
        switch EventBookingRows.allValues[indexPath.row] {
        case .header:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:kHeaderCellIdentifier,
                                                          for: indexPath) as! HeaderCollectionViewCell
            
            cell.cellTitle = EventBookingRows.allValues[indexPath.row].title()
            
            
            currentCell = cell;

            break;
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:kDetailCellIdentifier,
                                                          for: indexPath) as! CascadeCollectionViewCell

            
            cell.cellTitle = EventBookingRows.allValues[indexPath.row].title()
            cell.bookingType = EventBookingRows.allValues[indexPath.row]
            cell.dataSource = self.reservationDataArray[EventBookingRows.allValues[indexPath.row]]

            currentCell = cell;
            //get the selection
            cell.selectedOptionIndex = {[unowned self] (index, type) in
                
                let value =  (self.reservationDataArray[type]![index])
                
                print("selected value = \(value)");
                
            }
            break
            
        }

        return currentCell!;
    }
}

extension EventBookingViewController : UICollectionViewDelegateFlowLayout {


    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var heightPerItem:CGFloat
        switch EventBookingRows.allValues[indexPath.row] {
        case .header:
            heightPerItem = 240.0
            
        default:
            heightPerItem = cricelButtonSize + 50.0
            
        }
        return CGSize(width: collectionView.bounds.size.width, height: heightPerItem)

    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
   
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
