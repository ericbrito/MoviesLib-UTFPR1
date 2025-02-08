//
//  MoviesView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 08/02/25.
//

import SwiftUI

enum NavigationScreen: Hashable {
    case detail(Movie)
    case form(Movie?)
}

struct MoviesView: View {

    @State private var path = NavigationPath()
    @State private var searchString: String = ""

    var body: some View {
        NavigationStack(path: $path) {
            MovieListingView(searchString: searchString)
                .navigationTitle("Filmes")
                .searchable(text: $searchString, prompt: "Entre com o nome do filme")
                .navigationDestination(for: NavigationScreen.self) { destination in
                    switch destination {
                    case .detail(let movie):
                        MovieDetailView(movie: movie)
                    case .form(let movie):
                        MovieFormView(movie: movie, path: $path)
                    }
                }
                .toolbar {
                    Button("", systemImage: "plus.circle.fill") {
                        path = NavigationPath([NavigationScreen.form(nil)])
                    }
                }
        }
    }
}

#Preview {
    MoviesView()
}
