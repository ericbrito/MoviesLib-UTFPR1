//
//  MoviesLibApp.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 08/02/25.
//

import SwiftData
import SwiftUI

@main
struct MoviesLibApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Movie.self)
    }
}
