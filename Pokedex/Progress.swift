//
//  ProgressView.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/07/25.
//

import SwiftUI
import Foundation

func sumElementTypes(captured: [Pokemon], elementTypes: inout [ElementType: Int]) {
    for (element, _) in Array(elementTypes) {
        elementTypes[element]! = 0

    }
    
    for pokemon in captured {
        for (element, _) in Array(elementTypes) {
            if (pokemon.types.first == element) {
                elementTypes[element]! += 1
            }
        }
    }
}

struct Progress: View {
    @State private var valueProgress = 0.5
    @Binding var captured: [Pokemon]
    
    @State var elementTypes: [ElementType: Int] = [
        .grass: 0,
        .poison: 0,
        .fire: 0,
        .flying: 0,
        .water: 0,
        .bug: 0,
        .normal: 0,
        .electric: 0,
        .ground: 0,
        .fairy: 0,
        .psychic: 0,
        .rock: 0,
        .ice: 0,
        .dragon: 0,
        .dark: 0,
        .steel: 0,
        .fighting: 0,
        .ghost: 0
    ]

    
    var body: some View {
        VStack {
            VStack (spacing: 15) {
                HStack {
                    Text("My Progress")
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                    Spacer()
                }
                HStack {
                    Text("\(captured.count)/151 Caught pokemons")
                    .fontWeight(.semibold)
                        .font(.system(size: 16))
                    Spacer()
                }
            }
            
            
            ZStack {
               Circle()
                   .stroke(
                       Color.pink.opacity(0.5),
                       lineWidth: 30
                   )
                let percent =  Double(captured.count)/151
                
                Text("\(Int(percent*100))%")
                    .fontWeight(.bold)
                    .font(.system(size: 32))

               Circle()
                   .trim(from: 0, to: percent) // 1
                   .stroke(
                       Color.pink,
                       lineWidth: 30
                   )
           }
            .frame(width: 200, height: 300)

            ScrollView (.horizontal) {
                HStack (alignment: .top, spacing: 30) {

                    ForEach(Array(elementTypes), id: \.key) { (element, count) in

                        ZStack {
                            ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 100, height: 100)
                                        .foregroundStyle(element.color)
                                    
                                    element.image
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .opacity(0.65)
                                
                                
                                    Text("\(count)")
                                        .fontWeight(.bold)
                                        .font(.system(size: 32))

                                }
                               
                            }
                            
                    }
                }
            }
            
        }
        .padding(28)
        .onChange(of: captured) { _ in
            sumElementTypes(captured: captured, elementTypes: &elementTypes)
        }
        
    }
}

