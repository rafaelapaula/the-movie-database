//
//  MoviesRepository.swift
//  TheMovieDatabase
//
//  Created by rafaela.lourenco on 14/10/22.
//

import Foundation

// MARK: - MoviesResponse
struct MoviesResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

protocol MoviesRepositoryProtocol: AutoMockable {
    func getPopularMovieList(completion: @escaping ((Result<MoviesResponse,Error>) -> (Void)))
}

class MoviesRepository: MoviesRepositoryProtocol {
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func getPopularMovieList(completion: @escaping ((Result<MoviesResponse,Error>) -> (Void))) {
        networkManager.request(
            with: Constants.Endpoints.popularUrl,
            parameters: nil) { result in
                switch result {
                case .success(let data):
                    do {
                        let decodedUsers = try JSONDecoder().decode(MoviesResponse.self, from: data)
                        completion(.success(decodedUsers))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
