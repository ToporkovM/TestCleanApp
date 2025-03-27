//
//  LoginModel.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 24.03.2025.
//

struct LoginModel: Decodable {
    let authorized: Bool?
    let user: UserModel?
}

struct UserModel: Decodable {
    let firstName: String?
    let lastName: String?
}
