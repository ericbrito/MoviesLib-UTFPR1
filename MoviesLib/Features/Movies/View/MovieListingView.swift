//
//  MovieListingView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 08/02/25.
//

import SwiftData
import SwiftUI

struct MovieListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]

    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(value: NavigationScreen.detail(movie)) {
                    MovieListingRowView(movie: movie)
                }
            }
            .onDelete(perform: deleteMovie)
        }
    }

    func deleteMovie(_ indexSet: IndexSet) {
        for index in indexSet {
            let movie = movies[index]
            modelContext.delete(movie)
        }
    }
}

#Preview {
    MovieListingView()
}
