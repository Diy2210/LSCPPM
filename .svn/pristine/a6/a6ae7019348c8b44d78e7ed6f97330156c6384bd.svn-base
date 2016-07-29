//
//  Settings.swift
//  LSCPPM
//
//  Created by Vladimir Zabara on 1/27/16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import Foundation

class Settings {
    
    class var sharedInstance: Settings {
        struct Singleton {
            static let instance = Settings()
        }
        return Singleton.instance
    }
    
    internal var settings: NSMutableDictionary!
    internal var path: String!
    
    required init() {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0]
        self.path = documentsDirectory.stringByAppendingPathComponent("Settings.plist")
        
        let fileManager = NSFileManager.defaultManager()
        
        // check if file exists
        if !fileManager.fileExistsAtPath(self.path) {
            // If it doesn't, copy it from the default file in the Bundle
            if let bundlePath = NSBundle.mainBundle().pathForResource("Settings", ofType: "plist") {
                do {
                    try fileManager.copyItemAtPath(bundlePath, toPath: self.path)
                } catch {
                    print("Something wrong while copiying plist file")
                }
            } else {
                print("Settings.plist not found. Please, make sure it is part of the bundle.")
            }
        }
        self.settings = NSMutableDictionary(contentsOfFile:self.path)
    }
    
    var serverURL: String {
        get {
            return settings["Server URL"] as! String
        }
        set(newValue) {
            settings.setValue(newValue, forKey: "Server URL")
            settings.writeToFile(path, atomically: false)
        }
    }
    
    var alsEndPoint: String {
        get {
            return settings["ALS End Point"] as! String
        }
        set(newValue) {
            settings.setValue(newValue, forKey: "ALS End Point")
            settings.writeToFile(path, atomically: false)
        }
    }
    
    var authEndPoint: String {
        get {
            return settings["Auth End Point"] as! String
        }
        set(newValue) {
            settings.setValue(newValue, forKey: "Auth End Point")
            settings.writeToFile(path, atomically: false)
        }
    }
    
    var messagesEndPoint: String {
        get {
            return settings["Messages End Point"] as! String
        }
        set(newValue) {
            settings.setValue(newValue, forKey: "Messages End Point")
            settings.writeToFile(path, atomically: false)
        }
    }
    
    var username: String {
        get {
            return settings["username"] as! String
        }
        set(newValue) {
            settings.setValue(newValue, forKey: "username")
            settings.writeToFile(path, atomically: false)
        }
    }
    
    var password: String {
        get {
            return settings["password"] as! String
        }
        set(newValue) {
            settings.setValue(newValue, forKey: "password")
            settings.writeToFile(path, atomically: false)
        }
    }
}