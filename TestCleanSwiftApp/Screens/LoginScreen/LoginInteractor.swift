//
//  LoginInteractor.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 29.05.2024.
//

import Foundation

typealias LoginInteractorInput = LoginViewControllerOutput

protocol LoginInteractorOutput: AnyObject {
    func showLogingSuccess(model: LoginModel)
    func showLogingFailure(message: String)
}

final class LoginInteractor {
    var presenter: LoginPresenterInput?
    var authWorker: LoginWorker?
}

extension LoginInteractor: LoginInteractorInput {
    func tryToLogIn() {
        authWorker?.makeAuth { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let model):
                guard let model else {
                    self.presenter?.showLogingFailure(message: "Login failure")
                    return
                }
                if model.authorized ?? false {
                    self.presenter?.showLogingSuccess(model: model)
                } else {
                    self.presenter?.showLogingFailure(message: "Login failure")
                }
            case .failure(let error):
                self.presenter?.showLogingFailure(message: error.localizedDescription)
            }
        }
    }
}
