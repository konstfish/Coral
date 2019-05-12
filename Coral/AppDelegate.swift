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
    @IBOutlet weak var testWindowMenuItem: NSMenuItem!
    let vc = ViewController ()
    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }

    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
}

