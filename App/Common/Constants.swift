//
//  Constants.swift
//  TheMovieDatabase
//
//  Created by rafaela.lourenco on 14/10/22.
//

import Foundation

struct Constants {
    struct Network {
        static let baseUrl = "https://api.themoviedb.org/3"
        static let apiKey = "98afa825fe8d3ef64fd933b2954f0e4e"
    }
    
    struct Endpoints {
        static let popularUrl = URL(string:"\(Network.baseUrl)/movie/popular")!
    }
}
