//
//  CustomersTableViewController.swift
//  LSCPPM
//
//  Created by Diy2210 on 12.02.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class CustomersTableViewController: UITableViewController {
    
    var findCustomers: SOAPfindCustomers?

    override func viewDidLoad() {
        super.viewDidLoad()
        findCustomers = SOAPfindCustomers(parent: self)
        findCustomers!.getData(0, limit: 0)

        // Refresh Control
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: #selector(CustomersTableViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl!.endRefreshing()
        
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
        return findCustomers!.records.count
    }
    
    // CustomersCell
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("CustomersCell", forIndexPath: indexPath)
        cell.textLabel!.text = findCustomers!.records[indexPath.row]["email"] as? String
        cell.detailTextLabel?.text = findCustomers!.records[indexPath.row]["name"] as? String
        cell.tag = indexPath.row
        
        return cell
        
    }
    
    // Show Detail Customer
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailCustomer" {
            //print(self.records[(sender?.tag)!])
            let customerDetailsVC = segue.destinationViewController as! CustomerDetailsViewController
            customerDetailsVC.record = findCustomers!.records[(sender?.tag)!] as! [String : String]
            
        }
    }
    
    // Refresh
    func refresh(sender:AnyObject) {
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
        
    }
}
