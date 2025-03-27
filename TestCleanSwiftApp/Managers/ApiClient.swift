//
//  NetworkManager.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 24.03.2025.
//

import Foundation

enum ResultEntity<T, E> where E: Error {
    case success(T)
    case failure(E)
}

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case invalidMockPath
    case invalidURL
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: 
            return "Request Failed"
        case .jsonConversionFailure:
            return "Json Conversion Failure"
        case .invalidData: 
            return "Invalid Data"
        case .invalidMockPath:
            return "Invalid Mock Path"
        case .invalidURL:
            return "Invalid URL"
        }
    }
}

protocol ApiClientProtocol: AnyObject {
    func sendRequest(for request: URLRequest, needSuccess: Bool, completion: @escaping (ResultEntity<Data?, APIError>) -> Void)
}

final class ApiClient: ApiClientProtocol {
    static let shared: ApiClient = ApiClient()
    
    private init() {}
    
    func sendRequest(for request: URLRequest, needSuccess: Bool, completion: @escaping (ResultEntity<Data?, APIError>) -> Void) {
        var statusCode: Int = 404
        var data: Data? = nil
        
        switch request.url?.absoluteString {
        case "https://maxtoporkov.com/api/v1/login":
            let path: String?
            
            if needSuccess {
                path = Bundle.main.path(forResource: "AuthService+successResponse", ofType: "json")
            } else {
                path = Bundle.main.path(forResource: "AuthService+failureResponse", ofType: "json")
            }
            do {
                guard let path else {
                    statusCode = 404
                    return
                }
                data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                statusCode = 200
            } catch {
                statusCode = 404
                return
            }
        default:
            statusCode = 500
        }
        
        guard statusCode >= 200 && statusCode < 300 else {
            completion(.failure(.requestFailed))
            return
        }
        completion(.success(data))
    }
}
