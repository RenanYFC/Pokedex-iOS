//
//  Pokemon.swift
//  SwiftUIPresencial
//
//  Created by Aluno Mack on 14/07/25.
//

import SwiftUI

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
   
}

struct PokemonView: View {
    
    @Binding var captured: [Pokemon]
    
    let columns = [
        GridItem(.flexible(), alignment: .leading),
        GridItem(.flexible(), alignment: .trailing)
    ]
    
    enum Views: String {
        case viewPokemon
        case viewStatistic
    }
    
    @State var opacity = 0.18
    @State var atualView: [Views] = [.viewPokemon, .viewStatistic]
    
    var body: some View {
        VStack (spacing: 30) {
            HStack {
                Text("Pokedex")
                    .fontWeight(.bold)
                    .font(.system(size: 32))
                Spacer()
            }

            ScrollView {
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(pokemons, id: \.self) { pokemon in
                                Button {
                                    
                                    if !captured.contains(pokemon) {
                                        captured.append(pokemon)
                                        
                                    } else {
                                        for (i, j) in captured.enumerated() {
                                            if (j == pokemon) {
                                                captured.remove(at: i)
                                                
                                            }
                                        }
                                        
                                    }
                                } label: {
                                    
                                        ZStack() {
                                            RoundedRectangle(cornerRadius: 15)
                                                .foregroundStyle(pokemon.types.first?.color ?? Color.gray)
                                            VStack(spacing: 0) {
                                                VStack(spacing: 0) {
                                                    Text("\(pokemon.name.capitalizeFirstLetter())")
                                                        .foregroundColor(.white)
                                                        .fontWeight(.bold)
                                                        .font(.system(size: 19))
                                                    AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/4bcd17051efacd74966305ac87a0330b6131259a/sprites/pokemon/\(pokemon.id).png")) { image in
                                                        image.resizable()
                                                    } placeholder: {
                                                        Image("defaultImg")
                                                    }
                                                    .frame(width: 100, height: 100)
                                                    
                                                    VStack{
                                                        ForEach(pokemon.types, id: \.self) { type in
                                                            ZStack {
                                                                RoundedRectangle(cornerRadius: 60)
                                                                    .frame(width: 91, height: 20)
                                                                    .foregroundColor(.black)
                                                                    .opacity(0.34)
                                                                Text("\(type.rawValue.capitalizeFirstLetter())")
                                                                    .foregroundColor(.white)
                                                                    .fontWeight(.semibold)
                                                                    .font(.system(size: 11))
                                                                    
                                                            }
                                                        }
                                                        
                                                        
                                                    }
                                                }
                                                
                                                
                                            }

                                        }
                                        .frame(width: 155, height: 190)
                                        .opacity(captured.contains(pokemon) ? 1.0 : 0.3)
                                    }
                            }
                            
                        }
                    }
            .frame(maxHeight: 500)
        }
        .padding(28)
        }
}

//struct Pokemon_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonView()
//    }
//}

/**
 AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/4bcd17051efacd74966305ac87a0330b6131259a/sprites/pokemon/\().png")) { image in
     image.resizable()
 } placeholder: {
     Color.red
 }
 .frame(width: 128, height: 128)
 */
