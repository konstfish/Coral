//
//  AppDelegate.swift
//  Coral
//
//  Created by David Fischer on 14.04.19.
//  Copyright © 2019 fISH. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let vc = ViewController ()
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func itemTest(_ sender: Any) {
        print("test")
    }
    
}

