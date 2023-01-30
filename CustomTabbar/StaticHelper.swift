//
//  StaticHelper.swift
//  ECore
//
//  Created by Pankaj's Mac Mini on 22/10/21.
//

import Foundation
import UIKit


class StaticHelper: NSObject {
    let bottomBarVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BottomBarViewController") as! BottomBarViewController
    
    var isInternetConnected = true
    func addBottomBarController(_ forVC: UIViewController){
     
       let bottomSheetVC = bottomBarVC

       // Add bottomSheetVC as a child view
        forVC.addChild(bottomSheetVC)
        forVC.view.addSubview(bottomSheetVC.view)
        forVC.view.clipsToBounds = true
        bottomSheetVC.view.layer.cornerRadius = 20.0
        bottomSheetVC.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        bottomSheetVC.didMove(toParent: forVC)


        let x = (SCREEN_WIDTH - CGFloat(bottomBarWidth))/2

        bottomSheetVC.view.frame = CGRect(x: x, y: UIScreen.main.bounds.height - CGFloat(65), width: CGFloat(bottomBarWidth) , height: CGFloat(bottomBarHeight))
       forVC.view.addSubview(bottomSheetVC.view)
    }
    static let shared = StaticHelper()
    
}
