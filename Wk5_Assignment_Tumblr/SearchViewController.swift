//
//  SearchViewController.swift
//  Wk5_Assignment_Tumblr
//
//  Created by Bryan Leung on 3/7/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loadingImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1217)
        scrollView.contentInset.bottom = 44
        scrollView.hidden = true
        scrollView.alpha = 0
        loadingImage.hidden = false
        
        var images = UIImage.animatedImageNamed("loading-", duration: 0.7)
        loadingImage.image = images

        // Do any additional setup after loading the view.



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool){
        delay(2, { () -> () in
            UIView.animateWithDuration(
                0.3, animations: { () -> Void in
                    self.scrollView.alpha = 1
                    self.loadingImage.alpha = 0
                    
            })
            self.scrollView.hidden = false
            self.loadingImage.hidden = true
        })
    }
    
    override func viewWillDisappear(animated: Bool) {
        scrollView.hidden = true
        loadingImage.hidden = false
        scrollView.alpha = 0
        loadingImage.alpha = 1
    }
}
