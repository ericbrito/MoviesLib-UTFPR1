//
//  MovieSummaryView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 08/02/25.
//

import SwiftUI

struct MovieSummaryView: View {
    let summary: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Sinopse")
                .padding(.top)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal)

            ScrollView {
                Text(summary)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(16)
        .padding(.vertical)
    }
}

#Preview {
    MovieSummaryView(summary: "Esse filme é o melhor filme de todos os tempos e nenhum barra ele!!!")
}
