//
//  IpadLSControlPanelTableViewController.swift
//  LSCPPM
//
//  Created by Diy2210 on 24.03.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class IpadLSControlPanelTableViewController: UITableViewController,UISplitViewControllerDelegate {
    
    var array: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.array.addObject("News")
        self.array.addObject("Customers")
        self.array.addObject("Licenses")
        
        self.tableView.reloadData()
        
        self.splitViewController!.delegate = self
        
        self.splitViewController!.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible

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
        return self.array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.array.objectAtIndex(indexPath.row) as? String
                
        return cell

  }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
        self.performSegueWithIdentifier("showNews", sender: self)
        }else if indexPath.row == 1 {
        self.performSegueWithIdentifier("showCustomers", sender: self)
        }else if indexPath.row == 2 {
        self.performSegueWithIdentifier("showLicenses", sender: self)
        }
    }
}
