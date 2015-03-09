//
//  TrendViewController.swift
//  Wk5_Assignment_Tumblr
//
//  Created by Bryan Leung on 3/8/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class TrendViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1217)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
