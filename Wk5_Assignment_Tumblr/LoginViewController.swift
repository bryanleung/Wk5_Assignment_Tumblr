//
//  LoginViewController.swift
//  Wk5_Assignment_Tumblr
//
//  Created by Bryan Leung on 3/8/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
    {
    @IBOutlet weak var emailField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        

    }
    
    @IBAction func didPressCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        emailField.resignFirstResponder()
    }




    
    
}
