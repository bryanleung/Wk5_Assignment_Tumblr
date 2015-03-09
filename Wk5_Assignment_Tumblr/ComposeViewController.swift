//
//  ComposeViewController.swift
//  Wk5_Assignment_Tumblr
//
//  Created by Bryan Leung on 3/8/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController
    {
    
    var duration: NSTimeInterval! = 0.3
    
    @IBOutlet weak var link: UIButton!
    @IBOutlet weak var quote: UIButton!
    @IBOutlet weak var photo: UIButton!
    @IBOutlet weak var video: UIButton!
    @IBOutlet weak var chat: UIButton!
    @IBOutlet weak var text: UIButton!
    
    var originLinkCenter: CGPoint!
    var originQuoteCenter: CGPoint!
    var originPhotoCenter: CGPoint!
    var originVideoCenter: CGPoint!
    var originChatCenter: CGPoint!
    var origintextCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originLinkCenter = link.center
        originQuoteCenter = quote.center
        originPhotoCenter = photo.center
        originVideoCenter = video.center
        originChatCenter = chat.center
        origintextCenter = text.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func resetPosition(){
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.link.center = self.originLinkCenter
            self.quote.center = self.originQuoteCenter
            self.photo.center = self.originPhotoCenter
            self.video.center = self.originVideoCenter
            self.chat.center = self.originChatCenter
            self.text.center = self.origintextCenter
        })

        
    }
    

    @IBAction func onTapNevermind(sender: UITapGestureRecognizer) {
        //resetPosition()
        dismissViewControllerAnimated(true, completion: nil)
    }
}
