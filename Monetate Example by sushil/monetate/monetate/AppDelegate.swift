//
//  AppDelegate.swift
//  monetate
//
//  Created by Sushil Tiwari on 07/10/21.
//

import UIKit
import LGSideMenuController

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupPersonalizationSDK()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftMenuController")
               let rightViewController = UITableViewController()

               // 3. Create instance of LGSideMenuController with above controllers as root and left.
               let sideMenuController = LGSideMenuController(rootViewController: initialViewController,
                                                             leftViewController: leftViewController,
                                                             rightViewController: rightViewController)

               // 4. Set presentation style by your taste if you don't like the default one.
               sideMenuController.leftViewPresentationStyle = .slideAboveBlurred
               sideMenuController.rightViewPresentationStyle = .slideBelowShifted

               // 5. Set width for the left view if you don't like the default one.
               sideMenuController.leftViewWidth = 250.0
               sideMenuController.rightViewWidth = 100.0


let navController = UINavigationController(rootViewController: sideMenuController)


            self.window?.rootViewController = navController
            self.window?.makeKeyAndVisible()
       
        // Override point for customization after application launch.
        return true
    }



}

