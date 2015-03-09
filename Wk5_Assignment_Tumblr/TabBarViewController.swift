//
//  TabBarViewController.swift
//  Wk5_Assignment_Tumblr
//
//  Created by Bryan Leung on 3/7/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var contentView: UIView!
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewController: ComposeViewController!
    var trendViewController: TrendViewController!
    var accountViewController: AccountViewController!
    var currentViewController: UIViewController!
    
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    var viewControllersArray: [UIViewController]! = [UIViewController]()

    var selectedIndex: Int! = 0
    var duration: NSTimeInterval = 0.4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeStory") as HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchStory") as SearchViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("composeStory") as ComposeViewController
        trendViewController = storyboard.instantiateViewControllerWithIdentifier("trendStory") as TrendViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountStory") as AccountViewController
        
        viewControllersArray = [homeViewController, searchViewController, accountViewController, trendViewController]
        
        
        currentViewController = viewControllersArray[selectedIndex]
        tabBarDidPress(buttons[selectedIndex])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func tabBarDidPress(sender: AnyObject) {
        // selectedIndex is the current button thats selected
        buttons[selectedIndex].selected = false
        selectedIndex = sender.tag
        buttons[selectedIndex].selected = true
        
        //viewControllersArray[selectedIndex]
        removeChildView(currentViewController)
        addChildViewController(viewControllersArray[selectedIndex])
        var selectedView = viewControllersArray[selectedIndex].view
        selectedView.frame = contentView.frame
        contentView.addSubview(viewControllersArray[selectedIndex].view)
        viewControllersArray[selectedIndex].didMoveToParentViewController(self)
        currentViewController = viewControllersArray[selectedIndex]
        
    }
    
    func removeChildView(content: UIViewController){
        
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
        
    }
    
    @IBAction func onTapCompose(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("composeSegue", sender: self)
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
        //println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        

        
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            var destinationVC = toViewController as ComposeViewController
            var chatIcon = destinationVC.chat
            var quoteIcon = destinationVC.quote
            var photoIcon = destinationVC.photo
            var videoIcon = destinationVC.video
            var textIcon = destinationVC.text
            var linkIcon = destinationVC.link
            
            textIcon.center.y = 800
            chatIcon.center.y = 700
            videoIcon.center.y = 600
            photoIcon.center.y = 500
            quoteIcon.center.y = 400
            linkIcon.center.y = 300
            
            UIView.animateWithDuration(duration, animations: { () -> Void in
                toViewController.view.alpha = 1
                chatIcon.center.y = destinationVC.originChatCenter.y
                quoteIcon.center.y = destinationVC.originQuoteCenter.y
                photoIcon.center.y = destinationVC.originPhotoCenter.y
                videoIcon.center.y = destinationVC.originVideoCenter.y
                textIcon.center.y = destinationVC.origintextCenter.y
                linkIcon.center.y = destinationVC.originLinkCenter.y
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        }
        
        else {
            
            var destinationVC = fromViewController as ComposeViewController
            var chatIcon = destinationVC.chat
            var quoteIcon = destinationVC.quote
            var photoIcon = destinationVC.photo
            var videoIcon = destinationVC.video
            var textIcon = destinationVC.text
            var linkIcon = destinationVC.link
            
            
            UIView.animateWithDuration(duration, animations: { () -> Void in
                fromViewController.view.alpha = 0
                linkIcon.center.y = destinationVC.originLinkCenter.y - 800
                quoteIcon.center.y = destinationVC.originQuoteCenter.y - 700
                photoIcon.center.y = destinationVC.originPhotoCenter.y - 600
                videoIcon.center.y = destinationVC.originVideoCenter.y - 500
                chatIcon.center.y = destinationVC.originChatCenter.y - 400
                textIcon.center.y = destinationVC.origintextCenter.y - 300
                
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    
}
