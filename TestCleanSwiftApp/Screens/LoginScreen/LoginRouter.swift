//
//  LoginRouter.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 24.03.2025.
//

import UIKit

protocol LoginRoutingProtocol {
    func showLoginSuccess()
    func showLogingFailure(message: String)
}

final class LoginRouter {
    weak var source: UIViewController?
    
    private let sceneFactory: LoginSceneFactory
    
    init(sceneFactory: LoginSceneFactory) {
        self.sceneFactory = sceneFactory
    }
}

extension LoginRouter: LoginRoutingProtocol {
    func showLogingFailure(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        source?.present(alert, animated: true)
    }
    
    func showLoginSuccess() {
        let scene = sceneFactory.makeLoginScene()
        source?.navigationController?.pushViewController(scene, animated: true)
    }
}
