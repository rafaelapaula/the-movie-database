//
//  MovieListViewModel.swift
//  TheMovieDatabase
//
//  Created by rafaela.lourenco on 14/10/22.
//

import Foundation
import SwiftUI

protocol MovieListViewModelProtocol: ObservableObject, AutoMockable {
    var list: [Movie] { get set }
    func load()
}

class MovieListViewModel: ObservableObject {
    @Published var list: [Movie] = []
    let moviesRepository: MoviesRepositoryProtocol
    
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository()) {
        self.moviesRepository = moviesRepository
    }
    
    func load() {
        moviesRepository.getPopularMovieList { [weak self] result in
            switch result {
            case .success(let data):
                self?.list = data.results
            case .failure(let _):
                print("error")
            }
        }
    }
}
