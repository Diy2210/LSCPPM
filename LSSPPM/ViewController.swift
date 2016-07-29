//
//  ViewController.swift
//  Demo1
//
//  Created by Diy2210 on 25.01.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let username = Settings.sharedInstance.username
        let password = Settings.sharedInstance.password
        // print(username)
        // print(password)
        if username.isEmpty || password.isEmpty {
            // show auth form
            // AutorizationViewController.showViewController()
            print("show auth form")
        } else {
            print("ready to show table")
        }
        return true
    }
}