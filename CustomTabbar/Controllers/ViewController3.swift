//
//  ViewController3.swift
//  CustomTabbar
//
//  Created by MC-MM0019-DhananjayKumar on 25/01/23.
//

import Foundation
import UIKit

class ViewController3:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        StaticHelper.shared.addBottomBarController(self)
    }
}
