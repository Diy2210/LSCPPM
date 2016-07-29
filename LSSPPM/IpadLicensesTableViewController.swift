//
//  IpadLicensesTableViewController.swift
//  LSCPPM
//
//  Created by Diy2210 on 01.04.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class IpadLicensesTableViewController: UITableViewController {
    
    var findLicense: SOAPfindLicenses?

    override func viewDidLoad() {
        super.viewDidLoad()

        findLicense = SOAPfindLicenses(parent: self)
        findLicense!.getData(0, limit: 0)
        
        // Refresh Control
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: #selector(IpadLicensesTableViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl!.endRefreshing()
        
        navigationItem.rightBarButtonItem = self.splitViewController!.displayModeButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return findLicense!.records.count
    }

    // LicenseCell
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LicensesCell", forIndexPath: indexPath) as! IpadLicenseCell
        cell.licenseId.text = findLicense!.records[indexPath.row]["licenseId"] as? String
        cell.customerEmail.text = findLicense!.records[indexPath.row]["customerEmail"] as? String
        cell.licenseTemplate.text = findLicense!.records[indexPath.row]["licenseTemplate"] as? String
        cell.tag = indexPath.row
        
        return cell
    }
    
    // Show Detail License
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailLicense" {
            //print(self.records[(sender?.tag)!])
            let licenseDetailsVC = segue.destinationViewController as! IpadLicenseDetailsViewController
            licenseDetailsVC.record = findLicense!.records[(sender?.tag)!] as! [String : String]
            
        }
    }
    
    // Refresh
    func refresh(sender:AnyObject) {
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
        
    }

}
