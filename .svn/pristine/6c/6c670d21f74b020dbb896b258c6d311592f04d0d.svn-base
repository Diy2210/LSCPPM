//
//  Customers.swift
//  Demo1
//
//  Created by Diy2210 on 09.02.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class Customers: UIViewController, NSURLConnectionDelegate, NSXMLParserDelegate {

    @IBOutlet weak var CustomersTableView: UITableView!
    
    func getData() {
    
    let mutableData:NSMutableData = NSMutableData()
    let currentElementName: NSString = ""
    
    
    let customers = Customers.self
    let soapMessage = "<?xml version='1.0' encoding='UTF-8'?><env:Envelope xmlns:env='http://www.w3.org/2003/05/soap-envelope' xmlns:ns1='http://ls.coderebel.com/ls/ns/als'><env:Body><ns1:findCustomers><ns1:adminCredentials><ns1:login>wlady_test_partner</ns1:login><ns1:password>wlady_test_partner</ns1:password></ns1:adminCredentials><ns1:searchOffset>0</ns1:searchOffset><ns1:searchLimit></ns1:searchLimit><ns1:variableNames><ns1:item>name</ns1:item><ns1:item>email</ns1:item></ns1:variableNames></ns1:findCustomers></env:Body></env:Envelope>"
    
    
    let urlString = "https://ls.staging.coderebel.com/ls/ns/als/clsals"
    
    let url = NSURL(string: urlString)
    
    let theRequest = NSMutableURLRequest(URL: url!)
    
    let msgLength = String(soapMessage.characters.count)
    
    theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
    theRequest.addValue(msgLength, forHTTPHeaderField: "Content-Length")
    theRequest.HTTPMethod = "POST"
    theRequest.HTTPBody = soapMessage.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) // or false
    
    let connection = NSURLConnection(request: theRequest, delegate: self, startImmediately: true)
    connection!.start()
    
    if (connection == true) {
    let mutableData : NSMutableData = NSMutableData()
    }
    
}

// NSURLConnectionDelegate

// NSURL


func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
    mutableData.length = 0;
}

func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
    mutableData.appendData(data)
}

func connectionDidFinishLoading(connection: NSURLConnection!) {
    let xmlParser = NSXMLParser(data: mutableData)
    xmlParser.delegate = self
    xmlParser.parse()
    xmlParser.shouldResolveExternalEntities = true
    
}

// NSXMLParserDelegate

func parser(parser: NSXMLParser, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: NSDictionary!) {
currentElementName = elementName
}

func parser(parser: NSXMLParser, foundCharacters string: String) {
    if currentElementName == "Customers" {
        
    }
}
}