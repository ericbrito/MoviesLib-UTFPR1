//
//  MainView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 08/02/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Label("Filmes", systemImage: "movieclapper.fill")
                }
            Text("Mapa")
                .tabItem {
                    Label("Mapa", systemImage: "map.fill")
                }

            Text("Ajustes")
                .tabItem {
                    Label("Ajustes", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    MainView()
}
