//
//  ViewController.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 29.05.2024.
//

import UIKit

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
    
    private let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    @objc private func enterButtonTapped() {
        
    }
}

private struct Constants {
    let titleText: String = "Войдите в систему"
    let loginPlaceholder: String = "Логин"
    let passwordPlaceholder: String = "Пароль"
    let buttonText: String = "Войти"
}
