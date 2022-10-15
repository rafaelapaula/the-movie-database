//
//  NetworkManager.swift
//  TheMovieDatabase
//
//  Created by rafaela.lourenco on 14/10/22.
//

import Alamofire

protocol NetworkManagerProtocol: AutoMockable {
    func request(with url: URL, parameters: [String: Any]?, completion: @escaping ((Result<Data, Error>) -> (Void)))
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared: NetworkManagerProtocol = NetworkManager()
    
    private init () {}
    
    func request(with url: URL, parameters: [String: Any]?, completion: @escaping ((Result<Data, Error>) -> (Void))) {
        
        let request = AF.request(url, parameters: prepare(parameters))
        request.response{ response in
                if let data = response.data {
                    completion(.success(data))
                    return
                }
                if let error = response.error {
                    completion(.failure(error))
                }
            }
    }
}

extension NetworkManager {
    private func prepare(_ parameters: [String: Any]?) -> [String: Any] {
        let values: [String: Any] = ["api_key": Constants.Network.apiKey]
        
        guard let extraValues = parameters
        else { return values }
        
        return values.merging(extraValues) { $1 }
    }
}
