//
//  SOAPfindLicenses.swift
//  LSCPPM
//
//  Created by Diy2210 on 16.03.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class SOAPfindLicenses: NSObject, NSXMLParserDelegate {
   
    var parser = NSXMLParser()
    var currentElement = ""
    // the container of all records
    var records = NSMutableArray()
    // the container of currect record
    var record: [String: String] = [:]
    // the container of currect elements
    var elements: [String: String] = [:]
    // current element name
    var varName = NSMutableString()
    // current element value
    var varValue = NSMutableString()
    // the flag we are in name element
    var inName = false
    // the flag we are in value element
    var inValue = false
    // the flag we are in head of record
    var inRecords = false
    // fill them from response
    var recCount = NSMutableString()
    var recOffset = NSMutableString()
    var recLimit = NSMutableString()
    var parentTableView: UITableViewController
    
    init(parent: UITableViewController) {
        self.parentTableView = parent
    }
    
    func getData(offset: Int, limit: Int = 10) {
        let url = NSURL(string: Settings.sharedInstance.serverURL + Settings.sharedInstance.alsEndPoint)
        let soapMessage =
        "<?xml version='1.0' encoding='UTF-8'?>" +
            "<env:Envelope xmlns:env='http://www.w3.org/2003/05/soap-envelope' xmlns:ns1='http://ls.coderebel.com/ls/ns/als'>" +
            "<env:Body>" +
            "<ns1:findLicenses>" +
            "<ns1:adminCredentials>" +
            "<ns1:login>\(Settings.sharedInstance.username)</ns1:login>" +
            "<ns1:password>\(Settings.sharedInstance.password)</ns1:password>" +
            "</ns1:adminCredentials>" +
            "<ns1:searchOffset>\(offset)</ns1:searchOffset>" +
            "<ns1:searchLimit>\(limit)</ns1:searchLimit>" +
            "<ns1:variableNames>" +
            "<ns1:item>licenseId</ns1:item>" +
            "<ns1:item>licenseType</ns1:item>" +
            "<ns1:item>licenseTemplate</ns1:item>" +
            "<ns1:item>licenseLimit</ns1:item>" +
            "<ns1:item>licenseSeats</ns1:item>" +
            "<ns1:item>issueDate</ns1:item>" +
            "<ns1:item>serviceDate</ns1:item>" +
            "<ns1:item>serviceMode</ns1:item>" +
            "<ns1:item>customerId</ns1:item>" +
            "<ns1:item>customerEmail</ns1:item>" +
            "<ns1:item>customerName</ns1:item>" +
            "<ns1:item>customerCompany</ns1:item>" +
            "<ns1:item>customerCountry</ns1:item>" +
            "<ns1:item>productName</ns1:item>" +
            "</ns1:variableNames>" +
            "</ns1:findLicenses>" +
            "</env:Body>" +
        "</env:Envelope>"
        let request = NSMutableURLRequest(URL: url!)
        let msgLength = String(soapMessage.characters.count)
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue(msgLength, forHTTPHeaderField: "Content-Length")
        request.HTTPMethod = "POST"
        request.HTTPBody = soapMessage.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) // or false
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            if error != nil {
                print(error!.description)
            } else {
                if let httpResponse = response as? NSHTTPURLResponse {
                    if httpResponse.statusCode < 400 {
                        self.parser = NSXMLParser(data: data!)
                        self.parser.delegate = self
                        // start XML parsing (see Parser methods)
                        self.parser.parse()
                    } else {
                        print("Error Code " + String(httpResponse.statusCode))
                    }
                }
            }
        })
        task.resume()
    }

    // MARK: Parser methods
    
    // find new element
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        currentElement = elementName
        // start of record element
        if (elementName as NSString).isEqualToString("ns1:licenseRecords")
        {
            records = []
            inRecords = true
        }
        // start of count element
        if (elementName as NSString).isEqualToString("ns1:count")
        {
            recCount = ""
        }
        // start of offset element
        if (elementName as NSString).isEqualToString("ns1:offset")
        {
            recOffset = ""
        }
        // start of limit element
        if (elementName as NSString).isEqualToString("ns1:limit")
        {
            recLimit = ""
        }
        // start of record element
        if (elementName as NSString).isEqualToString("ns1:record")
        {
            record = [:]
            inRecords = false
        }
        // start of variable element
        if (elementName as NSString).isEqualToString("ns1:variable")
        {
            elements = [:]
            varName = NSMutableString()
            varName = ""
            varValue = NSMutableString()
            varValue = ""
            inName = false
            inValue = false
        }
            // start of name element
        else if (elementName as NSString).isEqualToString("ns1:name")
        {
            inName = true
        }
            // start of value element
        else if (elementName as NSString).isEqualToString("ns1:value")
        {
            inValue = true
        }
    }
    
    // find new characters
    func parser(parser: NSXMLParser, foundCharacters string: String)
    {
        if inName {
            varName.appendString(string)
        }
        else if inValue {
            varValue.appendString(string)
        }
        else if inRecords {
            if (currentElement as NSString).isEqualToString("ns1:count") {
                recCount.appendString(string)
            }
            else if (currentElement as NSString).isEqualToString("ns1:offset") {
                recOffset.appendString(string)
            }
            else if (currentElement as NSString).isEqualToString("ns1:limit") {
                recLimit.appendString(string)
            }
            varValue.appendString(string)
        }
    }
    
    // find end of element
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if inName {
            // save the name
            elements["name"] = varName as String
            inName = false
        }
        else if inValue {
            // save the value
            elements["value"] = varValue as String
            inValue = false
        }
        else if !self.inName && !inValue {
            // save record field
            if (elementName as NSString).isEqualToString("ns1:variable") {
                record[elements["name"]!] = elements["value"]! as String
                elements = [:]
            }
                // save current record
            else if (elementName as NSString).isEqualToString("ns1:record") {
                records.addObject(record)
                record = [:]
            }
        }
    }
    
    // end of XML parsing
    func parserDidEndDocument(parser: NSXMLParser)
    {
        self.parentTableView.tableView.reloadData()
    }
}
