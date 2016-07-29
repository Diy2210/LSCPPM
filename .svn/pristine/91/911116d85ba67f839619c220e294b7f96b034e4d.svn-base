//
//  IpadNewsTableViewController.swift
//  LSCPPM
//
//  Created by Diy2210 on 25.04.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit
import CoreData

class IpadNewsTableViewController: UITableViewController, NSXMLParserDelegate {

    var parser = NSXMLParser()
    var news = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var messageId = NSMutableString()
    var messageType = NSMutableString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        news = []
        let url: NSURL = NSURL(string:"\(Settings.sharedInstance.messagesEndPoint)?lastId=&limit=")!
        parser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
        parser.parse()

        /*// Refresh Control
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: #selector(IpadNewsTableViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl!.endRefreshing()
        */
        /*//Custom navigation BarButton
        let button = UIButton()
        button.frame = CGRectMake(0, 0, 51, 31) //won't work if you don't set frame
        button.setImage(UIImage(named: "Zoom_In_Bold-25.png"), forState: .Normal)
        button.addTarget(self, action: Selector("zoomButton"), forControlEvents: .TouchUpInside)
        
        let barButton = UIBarButtonItem()
        barButton.customView = button
        self.navigationItem.rightBarButtonItem = barButton
        */
        
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        element = elementName
        if (element as NSString).isEqualToString("supportMessage") {
            elements = NSMutableDictionary()
            elements = [:]
            messageId = NSMutableString()
            messageId = "ID: "
            messageType = NSMutableString()
            messageType = "Type: "
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if (elementName as NSString).isEqualToString("supportMessage") {
            
            if messageId != "nil" {
                elements.setObject(messageId, forKey: "messageId")
            }
            if messageType != "nil" {
                elements.setObject(messageType, forKey: "messageType")
            }
            
            news.addObject(elements)
        }
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        if element.isEqualToString("messageId") {
            messageId.appendString(string)
        }else if element.isEqualToString("messageType") {
            messageType.appendString(string.capitalizedString)
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        
        self.tableView.reloadData()
        
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
        return news.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IpadNewsCell", forIndexPath: indexPath)
        
        cell.textLabel!.text = news.objectAtIndex(indexPath.row).objectForKey("messageId") as? String
        cell.detailTextLabel?.text = news.objectAtIndex(indexPath.row).objectForKey("messageType") as? String
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            news.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }
    }
}

