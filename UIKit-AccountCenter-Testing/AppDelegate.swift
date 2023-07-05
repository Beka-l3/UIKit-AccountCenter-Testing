//
//  AppDelegate.swift
//  UIKit-AccountCenter-Testing
//
//  Created by Bekzhan Talgat on 05.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = ViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

 


}

