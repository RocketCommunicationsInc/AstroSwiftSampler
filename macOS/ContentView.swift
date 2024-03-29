//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI
import AstroSwiftUtilities

struct ContentView: View {
    
    // Use this enum to allow List to track the selection (rather than using the simpler form of NavigationLink referencing the target view directly)
    enum Categories{
        case components,colors,symbols,dataVis
    }
    @State private var selection: Categories = .components
    @AppStorage(colorSchemeAutomaticName) var colorSchemeAutomatic:ColorSchemeAutomatic = .automatic

    var body: some View {
        
        // left side navigation
        NavigationSplitView{
            List(selection:$selection){
                NavigationLink(value: Categories.components) {
                    Label("Components", systemImage: "switch.2")
                }
                NavigationLink(value: Categories.colors) {
                    Label("Colors", systemImage: "paintpalette")
                }
                NavigationLink(value: Categories.symbols ) {
                    Label("Symbols", systemImage: "star")
                }
                NavigationLink(value: Categories.dataVis ) {
                    Label("Charts", systemImage: "chart.xyaxis.line")
                }

            }
            .frame(minWidth:100) // left column min width
        // main content
        } detail: {
            switch selection{
            case .components:
                Components()
            case .colors :
                ColorGrid()
            case .symbols:
                SymbolGrid()
            case .dataVis:
                Charts()
            }
        }
        .frame(minWidth:500, idealWidth: 800) // overall window min and ideal width
        .accentColor(Color("AccentColor")) // necessary because our forced light/dark modes, and UIAppearance usage, breaks automatic loading of AccentColor
        .preferredColorScheme(colorSchemeAutomatic == .light ? .light : colorSchemeAutomatic == .dark ? .dark : nil)

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
