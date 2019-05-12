//
//  ViewController.swift
//  Coral
//
//  Created by David Fischer on 14.04.19.
//  Copyright © 2019 fISH. All rights reserved.
//

import Cocoa
import Quartz
import Witness

class ViewController: NSViewController {

    
    @IBOutlet var pdfview: PDFView!
    @IBOutlet var thumbs: PDFThumbnailView!
    @IBOutlet var thumb_view: NSView!
    
    var titlebar = true
    var filename = ""
    var witness: Witness?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        //self.thumb_view.isHidden = true
        let document = self.view.window?.windowController?.document as! Document
        self.view.window?.title = document.displayName
        self.pdfview.document = document.pdfdoc
        self.pdfview.autoScales = true
        self.pdfview.acceptsDraggedFiles = true
        self.pdfview.backgroundColor = .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        self.pdfview.pageShadowsEnabled = true
        self.thumbs.pdfView = self.pdfview
        self.pdfview.scrollToBeginningOfDocument(nil) // to top lmao
        
        self.filename = document.fileURL!.absoluteString.replacingOccurrences(of: "file://", with: "").replacingOccurrences(of: "%20", with: " ")
        print(filename)
        // file change listener
        print("starting file listener")
        self.witness = Witness(paths: [filename], flags: .FileEvents, latency: 0.2) { events in
            print("file modified")
            // filters out update events
            if(events.description.contains("flags: Item Inode Meta Modification,Item Modified,Item Xattr Modification,Item Is File)]")){
                print("reloading PDF")
                self.refreshPDF()
            }
        }
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
        self.refreshPDF()
        titlebar = !titlebar
    }
    
    @IBAction func refreshPDFWindowItemSelected(_ sender: Any) {
       refreshPDF()
    }
    
    
    @IBAction func highlightTextWindowItemSelected(_ sender: Any) {
        highlightText(c: NSColor.red)
    }
    
    @IBAction func highlightRedTouchbarItemSelected(_ sender: Any) {
        highlightText(c: NSColor.red)
    }
    
    @IBAction func highlightOrangeTouchbarItemSelected(_ sender: Any) {
        highlightText(c: NSColor.orange)
    }
    
    @IBAction func highlightYellowTouchbarItemSelected(_ sender: Any) {
        highlightText(c: NSColor.yellow)
    }
    
    @IBAction func highlightGreenTouchbarItemSelected(_ sender: Any) {
        highlightText(c: NSColor.green)
    }
    
    @IBAction func highlightBlueTouchbarItemSelected(_ sender: Any) {
        highlightText(c: NSColor.blue)
    }
    
    @IBAction func highlightPurpleTouchbarItemSelected(_ sender: Any) {
        highlightText(c: NSColor.purple)
    }
    
    func refreshPDF() {
        let pdfdocu = PDFDocument(url: URL(fileURLWithPath: self.filename))
        if(pdfdocu != nil){ // crash if pdf is null
            self.pdfview.document = pdfdocu!
        }
    }
    
    func highlightText(c: NSColor) {
        let selections = pdfview.currentSelection?.selectionsByLine()
        guard let page = selections?.first?.pages.first else { return }
        
        selections?.forEach({ selection in
            let highlight = PDFAnnotation(bounds: selection.bounds(for: page), forType: .highlight, withProperties: nil)
            //print(highlight.isHighlighted)
            highlight.endLineStyle = .square
            highlight.color = c.withAlphaComponent(0.5)
            page.addAnnotation(highlight)
        })
    }
    
}
