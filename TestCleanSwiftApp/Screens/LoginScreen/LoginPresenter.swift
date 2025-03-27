//
//  LoginPresenter.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 29.05.2024.
//

import Foundation

typealias LoginPresenterInput = LoginInteractorOutput
typealias LoginPresenterOutput = LoginViewControllerInput

final class LoginScenePresenter {
    weak var viewController: LoginPresenterOutput?
}

extension LoginScenePresenter: LoginPresenterInput {
    func showLogingFailure(message: String) {
        viewController?.showLogingFailure(message: message)
    }
    
    func showLogingSuccess(model: LoginModel) {
        if let name = model.user?.firstName, let lastName = model.user?.lastName {
            viewController?.showLogingSuccess(fullUserName: name + " " + lastName)
        }
    }
}
