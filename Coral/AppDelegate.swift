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
    
    var preferencesController: NSWindowController?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }

    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func showPreferences(_ sender: Any) {
        if !(preferencesController != nil){
            let storyboard = NSStoryboard(name: "Preferences", bundle: nil)
            
            preferencesController = storyboard.instantiateInitialController() as? NSWindowController
            preferencesController!.showWindow(sender)
        }else{
            preferencesController!.showWindow(sender)
        }
    }
}

