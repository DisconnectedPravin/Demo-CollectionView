//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Domalwar, Pravin on 23/03/17.
//  Copyright © 2017 Domalwar, Pravin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.isHidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func bookEventButtonPressed()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "EventBooking", bundle:nil)
        let eventDetail = storyBoard.instantiateViewController(withIdentifier: "EventBookingSB") as! EventBookingViewController
        self.navigationController?.pushViewController(eventDetail, animated: true)
    }
    
    @IBAction func selectTypeOfEventButtonPressed()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "EventType", bundle:nil)
        let eventType = storyBoard.instantiateViewController(withIdentifier: "EventTypeSB") as! EventTypeViewController
        self.navigationController?.pushViewController(eventType, animated: true)
    }

}

