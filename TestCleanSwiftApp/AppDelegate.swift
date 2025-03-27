//
//  AppDelegate.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 29.05.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let scenFactory = LoginSceneFactory()
        scenFactory.configurator = LoginConfigurator(sceneFactory: scenFactory)
        let navigation = UINavigationController(rootViewController: scenFactory.makeLoginScene())
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}
