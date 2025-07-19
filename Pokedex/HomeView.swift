//
//  HomeView.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var captured: [Pokemon] = []

    
    var body: some View {
        TabView {
            PokemonView(captured: $captured)
                .tabItem()  {
                    Image(systemName: "star.circle")
                
                    Text("Pokedex")
                }
            
            Progress(captured: $captured)
                .tabItem()  {
                    Image(systemName: "chart.bar")
                    Text("Progress")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
