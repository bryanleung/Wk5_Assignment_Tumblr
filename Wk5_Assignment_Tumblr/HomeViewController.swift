//
//  HomeViewController.swift
//  Wk5_Assignment_Tumblr
//
//  Created by Bryan Leung on 3/7/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    var duration: NSTimeInterval! = 0.3

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            toViewController.view.transform = CGAffineTransformMakeScale(1.2, 1.2)
            UIView.animateWithDuration(duration, animations: { () -> Void in
                toViewController.view.alpha = 1
                toViewController.view.transform = CGAffineTransformMakeScale(1, 1)
                fromViewController.view.transform = CGAffineTransformMakeScale(1.05, 1.05)
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(duration, animations: { () -> Void in
                fromViewController.view.alpha = 0
                fromViewController.view.transform = CGAffineTransformMakeScale(1.2, 1.2)
                toViewController.view.transform = CGAffineTransformMakeScale(1, 1)
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        performSegueWithIdentifier("loginSegue", sender: nil)
    }

}
