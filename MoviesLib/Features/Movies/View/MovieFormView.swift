//
//  MovieFormView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 08/02/25.
//

import PhotosUI
import SwiftData
import SwiftUI

struct MovieFormView: View {
    @State private var selectedPoster: PhotosPickerItem?
    @State private var posterData: Data?
    @Bindable var movie: Movie
    @Binding var path: NavigationPath
    @Environment(\.modelContext) var modelContext
    let buttonTitle: String

    init(movie: Movie? = nil, path: Binding<NavigationPath>) {
        if let movie {
            self.movie = movie
            buttonTitle = "Salvar Alteração"
        } else {
            self.movie = Movie()
            buttonTitle = "Cadastrar filme"
        }
        self._path = path
    }

    var body: some View {
        VStack {
            form
            saveButton
        }
    }

    // MARK: - Form
    var form: some View {
        Form {
            Section("Título") {
                TextField("Nome do filme", text: $movie.title)
            }

            Section("Nota e Duração") {
                HStack {
                    TextField("Nota", value: $movie.rating, format: .number)
                    TextField("Duração", text: $movie.duration)
                }
            }
            Section("Catgegorias") {
                TextField("Principais categorias", text: $movie.categories)
            }

            Section("Sinopse") {
                TextEditor(text: $movie.summary)
                    .frame(height: 120)
            }

            Section("Pôster") {
                PhotosPicker(selection: $selectedPoster) {
                    Label("Selecione o pôster", systemImage: "photo")
                }
                if let posterData,
                   let uiimage = UIImage(data: posterData) {
                    Image(uiImage: uiimage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
        .listSectionSpacing(3)
        .navigationTitle(movie.title)
        .onChange(of: selectedPoster) { oldValue, newValue in
            Task {
                posterData = try await selectedPoster?.loadTransferable(type: Data.self)
                movie.image = posterData
            }
        }
        .onAppear {
            posterData = movie.image
        }
    }

    // MARK: - Save Button
    var saveButton: some View {
        Button {
            modelContext.insert(movie)
            path.removeLast()
        } label: {
            Text(buttonTitle)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .padding(16)
    }
}

#Preview {
    MovieFormView(movie: Movie(title: "", categories: "", duration: "", rating: 0, summary: "", image: nil), path: .constant(NavigationPath()))
}
