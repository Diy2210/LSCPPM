//
//  AutorizationViewController.swift
//  LSCPPM
//
//  Created by Diy2210 on 29.01.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class AutorizationViewController: UIViewController, UITextFieldDelegate {
     
    // MARK: Properties
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    // MARK: Actions
    @IBAction func CancelButton(sender: AnyObject) {
        self.msgBox("To exit the application, press the home", title: "Notification")
    }
    
    @IBAction func SubmitButton(sender: AnyObject) {
        let session = NSURLSession.sharedSession()
        let authURL = Settings.sharedInstance.serverURL + Settings.sharedInstance.authEndPoint
        let request = NSMutableURLRequest(URL: NSURL(string: authURL)!)
        let username = Username.text!
        let password = Password.text!
        if username.isEmpty || password.isEmpty {
            self.msgBox("Username and password cannot be empty")
            return
        }
        let postString = "username=\(username)&password=\(password)"
        
        request.HTTPMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        // UIApplication.sharedApplication().networkActivityIndicatorVisible = true

        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
        //    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            // Handle error
            guard error == nil else { return }
            
            var json: NSDictionary?
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
            } catch {
                self.msgBox("Could not parse JSON")
                return
            }
            
            // The JSONObjectWithData constructor didn't return an error. But, we should still
            // check and make sure that json has a value using optional binding.
            if let parseJSON = json {
                let success = parseJSON["success"] as? Bool
                if success == true {
                    // save username & password into Settings
                    Settings.sharedInstance.username = self.Username.text!
                    Settings.sharedInstance.password = self.Password.text!
                    dispatch_async(dispatch_get_main_queue(), {
                        self.performSegueWithIdentifier("SuccessResponse", sender: self)
                    })
                } else {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.msgBox("Username or password is incorrect. Please enter again")
                    })
                    return
                }
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    self.msgBox("Could not parse response")
                    return
                })
            }
        })
        task.resume()
    }

    private func msgBox(message: String, title: String = "Error") -> Void {
        let AlertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        AlertView.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(AlertView, animated: true, completion: nil)
    }
}
