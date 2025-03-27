//
//  ViewController.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 29.05.2024.
//

import UIKit

protocol LoginViewControllerInput: AnyObject {
  func showLogingSuccess(fullUserName: String)
  func showLogingFailure(message: String)
}

protocol LoginViewControllerOutput: AnyObject {
  func tryToLogIn()
}

class LoginViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = constants.titleText
        return label
    }()
    
    private lazy var loginTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = constants.loginPlaceholder
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.textContentType = .name
        return textField
    }()
    
    private lazy var passwordTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = constants.passwordPlaceholder
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.textContentType = .password
        return textField
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle(constants.buttonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var interactor: LoginInteractorInput?
    var router: LoginRoutingProtocol?
    
    private let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(enterButton)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        
        enterButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func enterButtonTapped() {
        interactor?.tryToLogIn()
    }
}

extension LoginViewController: LoginViewControllerInput {
  func showLogingSuccess(fullUserName: String) {
    router?.showLoginSuccess()
  }

  func showLogingFailure(message: String) {
    router?.showLogingFailure(message: message)
  }
}

private struct Constants {
    let titleText: String = "Войдите в систему"
    let loginPlaceholder: String = "Логин"
    let passwordPlaceholder: String = "Пароль"
    let buttonText: String = "Войти"
}
