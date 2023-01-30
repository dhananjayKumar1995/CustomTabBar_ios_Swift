//
//  HomeTabBarViewController.swift
//  ECore
//
//  Created by Dushyant Varshney on 27/10/21.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(notificationAction(_:)), name: NSNotification.Name.init(rawValue: "HomeTabSelection"), object: nil)
    }

    @objc func notificationAction(_ notificationInfo : NSNotification){
        
        self.selectedIndex = notificationInfo.userInfo!["id"] as! Int
    }
    
}
