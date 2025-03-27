//
//  AuthService.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 24.03.2025.
//

import Foundation

protocol AuthServiceProtocol {
    func auth(completion: @escaping (ResultEntity<LoginModel?, APIError>) -> Void)
}

class AuthService: AuthServiceProtocol {
    func auth(completion: @escaping (ResultEntity<LoginModel?, APIError>) -> Void) {
        guard let url = URL(string: "https://maxtoporkov.com/api/v1/login") else { return }
        RequestManager.shared.request(request: URLRequest(url: url),
                                      needSuccess: false,
                                      completion: completion)
    }
}
