//
//  AppRouter.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 29.05.2024.
//

import UIKit

protocol AppRouterProtocol {
    func setRootViewController()
}

final class AppRouter {
    static let shared = AppRouter()
    
    private var window: UIWindow?
    
    private init() {}
    
    func setRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = LoginViewController()
        let navigation = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
