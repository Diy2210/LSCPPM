//
//  IpadCustomerDetailsViewController.swift
//  LSCPPM
//
//  Created by Diy2210 on 31.03.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class IpadCustomerDetailsViewController: UIViewController {
    
    // Edit Customer Label
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    // Detail Customer Label
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var customerEmailLabel: UILabel!
    @IBOutlet weak var customerCompanyLabel: UILabel!
    @IBOutlet weak var customerCountryLabel: UILabel!
    @IBOutlet weak var customerCityLabel: UILabel!
    
    var record: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = self.splitViewController!.displayModeButtonItem()

        customerNameLabel.text = record["name"]
        customerEmailLabel.text = record["email"]
        customerCompanyLabel.text = !record["company"]!.isEmpty ? record["company"] : "-"
        customerCountryLabel.text = !record["country"]!.isEmpty ? record["country"] : "-"
        customerCityLabel.text = record["city"]!.isEmpty ? record["city"] : "-"
        
    }
}

