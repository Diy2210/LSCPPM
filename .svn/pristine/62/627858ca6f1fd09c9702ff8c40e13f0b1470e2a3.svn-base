//
//  IpadLicenseDetailsViewController.swift
//  LSCPPM
//
//  Created by Diy2210 on 04.04.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class IpadLicenseDetailsViewController: UIViewController {

    // Edit License Label
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var LimitLabel: UILabel!
    @IBOutlet weak var SeatsLabel: UILabel!
    @IBOutlet weak var IssueDateLabel: UILabel!
    @IBOutlet weak var ActivatedLabel: UILabel!
    @IBOutlet weak var SrviceModeLabel: UILabel!
    @IBOutlet weak var CustomerIdLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var CompanyLabel: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    
    
    // Detail License Label
    @IBOutlet weak var licenseIdLabel: UILabel!
    @IBOutlet weak var licenseTypeLabel: UILabel!
    @IBOutlet weak var licenseLimitLabel: UILabel!
    @IBOutlet weak var licenseSeatsLabel: UILabel!
    @IBOutlet weak var licenseIssueDateLabel: UILabel!
    @IBOutlet weak var licenseActivatedLabel: UILabel!
    @IBOutlet weak var licenseServiceModeLabel: UILabel!
    @IBOutlet weak var licenseCustomerIdLabel: UILabel!
    @IBOutlet weak var licenseCustomerEmailLabel: UILabel!
    @IBOutlet weak var licenseCustomerNameLabel: UILabel!
    @IBOutlet weak var licenseCustomerCompanyLabel: UILabel!
    @IBOutlet weak var licenseCustomerCountryLabel: UILabel!
    
    var record: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = self.splitViewController?.displayModeButtonItem()
        
        licenseIdLabel.text = record["licenseId"]
        licenseTypeLabel.text = record["licenseType"]
        licenseLimitLabel.text = record["licenseLimit"]
        licenseSeatsLabel.text = record["licenseSeats"]
        licenseIssueDateLabel.text = record["issueDate"]
        licenseActivatedLabel.text = !record["serviceDate"]!.isEmpty ? record["serviceDate"] : "Not activated"
        licenseServiceModeLabel.text = Int(record["serviceMode"]!) == 0 ? "Online" : "Offline"
        licenseCustomerIdLabel.text = record["customerId"]
        licenseCustomerEmailLabel.text = record["customerEmail"]
        licenseCustomerNameLabel.text = record["customerName"]
        licenseCustomerCompanyLabel.text = !record["customerCompany"]!.isEmpty ? record["customerCompany"] : "-"
        licenseCustomerCountryLabel.text = !record["customerCountry"]!.isEmpty ? record["customerCountry"] : "-"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}
