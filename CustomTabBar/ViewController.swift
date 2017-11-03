//
//  ViewController.swift
//  CustomTabBar
//
//  Created by IOS Developer on 07/03/17.
//  Copyright © 2017 iOSDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
   // var myViewController: UIViewController!
     
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController");
        accountViewController = storyboard.instantiateViewController(withIdentifier: "AccountViewController")
        trendingViewController = storyboard.instantiateViewController(withIdentifier: "TrendingViewController")
       //  myViewController = storyboard.instantiateViewController(withIdentifier: "myViewController")
      
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]

        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
    }

    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()

        sender.isSelected = true
        let vc = viewControllers[selectedIndex]

        addChildViewController(vc)

        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

