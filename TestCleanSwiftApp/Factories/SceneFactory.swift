//
//  SceneFactory.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 24.03.2025.
//

import UIKit

protocol LoginSceneFactoryProtocol {
    func makeLoginScene() -> UIViewController
}

final class LoginSceneFactory: LoginSceneFactoryProtocol {
    var configurator: LoginConfigurator?
    
    func makeLoginScene() -> UIViewController {
        return configurator?.configuredLogin(LoginViewController()) ?? UIViewController()
    }
}
