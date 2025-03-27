//
//  LoginWorker.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 24.03.2025.
//

import Foundation
import Combine

protocol LoginAuthProtocol {
    func makeAuth(completion: @escaping (ResultEntity<LoginModel?, APIError>) -> Void)
}

final class LoginWorker: LoginAuthProtocol {
    private let service: AuthService
    
    init(service: AuthService) {
        self.service = service
    }
    
    func makeAuth(completion: @escaping (ResultEntity<LoginModel?, APIError>) -> Void) {
        service.auth(completion: completion)
    }
}
