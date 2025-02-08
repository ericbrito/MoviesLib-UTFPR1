//
//  MovieListingRowView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 08/02/25.
//

import SwiftUI

struct MovieListingRowView: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 23) {
            Image(movie.imageSmall)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 80)
                .cornerRadius(8)
                .shadow(radius: 4, x: 2, y: 2)

            Text(movie.title)

            Spacer()
        }
    }
}

#Preview {
    MovieListingRowView(movie: Movie(title: "Matrix", categories: "", duration: "", rating: 0, summary: "", image: "matrix"))
}
