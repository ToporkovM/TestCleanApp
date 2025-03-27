//
//  LoginConfigurator.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 27.03.2025.
//

import Foundation

protocol LoginSceneConfiguratorProtocol {
    func configuredLogin(_ vc: LoginViewController) -> LoginViewController
}

final class LoginConfigurator: LoginSceneConfiguratorProtocol {
    private var sceneFactory: LoginSceneFactory
    
    init(sceneFactory: LoginSceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configuredLogin(_ vc: LoginViewController) -> LoginViewController {
        let authWorker = LoginWorker(service: AuthService())
        let interactor = LoginInteractor()
        let presenter = LoginScenePresenter()
        let router = LoginRouter(sceneFactory: sceneFactory)
        router.source = vc
        presenter.viewController = vc
        interactor.presenter = presenter
        interactor.authWorker = authWorker
        vc.interactor = interactor
        vc.router = router
        return vc
    }
}
