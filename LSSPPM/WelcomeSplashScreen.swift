//
//  WelcomeSplashScreen.swift
//  LSCPPM
//
//  Created by Diy2210 on 03.02.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class WelcomeSplashScreen: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let username = Settings.sharedInstance.username
        let password = Settings.sharedInstance.password
        if username.isEmpty || password.isEmpty {
            self.performSegueWithIdentifier("Autorization", sender: self)
        } else {
            self.performSegueWithIdentifier("MenuController", sender: self)
    }
  }
}