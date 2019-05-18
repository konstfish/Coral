//
//  PreferencesViewController.swift
//  Coral
//
//  Created by David Fischer on 18.05.19.
//  Copyright © 2019 fISH. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.preferredContentSize = NSMakeSize(self.view.frame.size.width, self.view.frame.size.height)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        //self.parent?.view.window?.title = self.title!
    }
}
