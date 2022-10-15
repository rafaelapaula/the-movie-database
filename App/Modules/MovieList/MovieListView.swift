//
//  MovieListView.swift
//  TheMovieDatabase
//
//  Created by rafaela.lourenco on 14/10/22.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel =  MovieListViewModel()
    
    var body: some View {
        List(viewModel.list) { item in
            Text(item.title)
        }.onAppear {
            viewModel.load()
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
