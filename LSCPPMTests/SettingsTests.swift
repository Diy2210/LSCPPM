//
//  SettingsTests.swift
//  LSCPPM
//
//  Created by Vladimir Zabara on 1/28/16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import XCTest

class SettingsTests: XCTestCase {
    
    private var setObj: Settings!
    
    override func setUp() {
        super.setUp()
        self.setObj = Settings()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetUsername() {
        // save username
        let tmpUsername = self.setObj.username
        self.setObj.username = "test username"
        XCTAssertEqual("test username", self.setObj.username)
        // restore username
        self.setObj.username = tmpUsername
    }
    
    func testSetPassword() {
        // save password
        let tmpPassword = self.setObj.password
        self.setObj.password = "test password"
        XCTAssertEqual("test password", self.setObj.password)
        // restore password
        self.setObj.password = tmpPassword
    }
    
    func testSetALSEndPoint() {
        //
        let tmpALSEndPoint = self.setObj.alsEndPoint
        self.setObj.alsEndPoint = "test alsEndPoint"
        XCTAssertEqual("test alsEndPoint", self.setObj.alsEndPoint)
        //
        self.setObj.alsEndPoint = tmpALSEndPoint
    }
    
    func testSetAuthEndPoin() {
        //
        let tmpAuthEndPoint = self.setObj.authEndPoint
        self.setObj.authEndPoint = "test authEndPoin"
        XCTAssertEqual("test authEndPoin", self.setObj.authEndPoint)
        //
        self.setObj.authEndPoint = tmpAuthEndPoint
    }

    func testSetServerURL() {
        // save serverURL
        let tmpServerURL = self.setObj.serverURL
        self.setObj.serverURL = "test serverURL"
        XCTAssertEqual("test serverURL", self.setObj.serverURL)
        // restore serverURL
        self.setObj.serverURL = tmpServerURL
    }

}