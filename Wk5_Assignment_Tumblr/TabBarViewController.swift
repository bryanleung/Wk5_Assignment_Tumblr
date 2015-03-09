//
//  TabBarViewController.swift
//  Wk5_Assignment_Tumblr
//
//  Created by Bryan Leung on 3/7/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewController: ComposeViewController!
    var trendViewController: TrendViewController!
    var accountViewController: AccountViewController!
    var currentViewController: UIViewController!
    
    @IBOutlet var buttons: [UIButton]!
    var viewControllersArray: [UIViewController]! = [UIViewController]()

    var selectedIndex: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeStory") as HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchStory") as SearchViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("composeStory") as ComposeViewController
        trendViewController = storyboard.instantiateViewControllerWithIdentifier("trendStory") as TrendViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountStory") as AccountViewController
        
        viewControllersArray = [homeViewController, searchViewController, composeViewController, accountViewController, trendViewController]
        
        
        currentViewController = viewControllersArray[selectedIndex]
        //didPressHome(self)
        
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

    
    @IBAction func didPressTrend(sender: AnyObject) {
        removeChildView(currentViewController)
        addChildViewController(trendViewController)
        var trendView = trendViewController.view
        trendView.frame = contentView.frame
        contentView.addSubview(trendViewController.view)
        trendViewController.didMoveToParentViewController(self)
        currentViewController = trendViewController
    }
    
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
}
