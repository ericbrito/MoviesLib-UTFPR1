//
//  MainView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 08/02/25.
//

import SwiftUI

struct MainView: View {
    @AppStorage(AppStorageKeys.color) private var color = 0

    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Label("Filmes", systemImage: "movieclapper.fill")
                }
            MapView()
                .tabItem {
                    Label("Mapa", systemImage: "map.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Ajustes", systemImage: "gearshape")
                }
        }
        .tint(colorFor(index: color))
    }

    private func colorFor(index: Int) -> Color {
        switch index {
        case 0:
            return Color.accentColor
        case 1:
            return Color.orange
        case 2:
            return Color.purple
        default:
            return Color.accentColor
        }
    }
}

#Preview {
    MainView()
}
