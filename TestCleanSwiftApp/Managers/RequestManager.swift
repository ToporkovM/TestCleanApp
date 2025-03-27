//
//  RequestManager.swift
//  TestCleanSwiftApp
//
//  Created by m.toporkov on 24.03.2025.
//

import Foundation

protocol RequestManagerInput {
    func request<T: Decodable>(request: URLRequest, needSuccess: Bool, completion: @escaping (ResultEntity<T?, APIError>) -> Void)
}

final class RequestManager: RequestManagerInput {
    static let shared: RequestManager = RequestManager()
    
    private init() {}
    
    func request<T: Decodable>(request: URLRequest, needSuccess: Bool, completion: @escaping (ResultEntity<T?, APIError>) -> Void) {
        ApiClient.shared.sendRequest(for: request, needSuccess: needSuccess) { result in
            switch result {
            case .success(let data):
                guard let data else {
                    completion(.failure(.invalidData))
                    return
                }
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                } catch _ {
                    completion(.failure(.jsonConversionFailure))
                    return
                }
            case .failure(_):
                completion(.failure(.requestFailed))
            }
        }
    }
}
