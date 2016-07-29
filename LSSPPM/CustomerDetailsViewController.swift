//
//  CustomerDetailsViewController.swift
//  LSCPPM
//
//  Created by Diy2210 on 29.02.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class CustomerDetailsViewController: UIViewController {
    
    // Edit Customer Label
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var CompanyLabel: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var CityLabel: UILabel!
    
    // Detail Customer Label
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var customerEmailLabel: UILabel!
    @IBOutlet weak var customerCompanyLabel: UILabel!
    @IBOutlet weak var customerCountryLabel: UILabel!
    @IBOutlet weak var customerCityLabel: UILabel!
    
    var record: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerNameLabel.text = record["name"]
        customerEmailLabel.text = record["email"]
        customerCompanyLabel.text = !record["company"]!.isEmpty ? record["company"] : "-"
        customerCountryLabel.text = !record["country"]!.isEmpty ? record["country"] : "-"
        customerCityLabel.text = record["city"]!.isEmpty ? record["city"] : "-"

        // Swipe Back to Customer
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respond:")
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
