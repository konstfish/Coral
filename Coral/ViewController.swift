//
//  ViewController.swift
//  Coral
//
//  Created by David Fischer on 14.04.19.
//  Copyright © 2019 fISH. All rights reserved.
//

import Cocoa
import Quartz

class ViewController: NSViewController {

    
    @IBOutlet var pdfview: PDFView!
    @IBOutlet var thumbs: PDFThumbnailView!
    @IBOutlet var thumb_view: NSView!
    
    var titlebar = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        self.thumb_view.isHidden = true
        let document = self.view.window?.windowController?.document as! Document
        self.view.window?.title = document.displayName
        self.pdfview.document = document.pdfdoc
        self.pdfview.autoScales = true
        self.pdfview.acceptsDraggedFiles = true
        self.pdfview.backgroundColor = .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        self.pdfview.pageShadowsEnabled = true
        self.thumbs.pdfView = self.pdfview
        self.pdfview.scrollToBeginningOfDocument(nil) // to top lmao
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func testWindowMenuItemSelected(_ sender: Any) {
        if self.thumb_view.isHidden == false {
            self.thumb_view.isHidden = true
        }else{
            self.thumb_view.isHidden = false
        }
    }
    
    @IBAction func hideBarWindowMenuItemSelected(_ sender: Any) {
        if titlebar {
            self.view.window?.styleMask.remove(.titled)
        }else{
            self.view.window?.styleMask.insert(NSWindow.StyleMask.titled)
        }
        titlebar = !titlebar
    }
    
}

