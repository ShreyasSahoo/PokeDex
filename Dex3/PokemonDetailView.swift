//
//  PokemonDetailView.swift
//  Dex3
//
//  Created by Shreyas Sahoo on 16/04/24.
//

import SwiftUI
import CoreData
import Charts
struct PokemonDetailView: View {
    @EnvironmentObject var pokemon : Pokemon
    @State var showShiny = true
    var body: some View {
        ScrollView{
            ZStack{
                Image("normalgrasselectricpoisonfairy")
                    .resizable()
                    .scaledToFit()
                    .shadow(color:.black,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                AsyncImage(url: showShiny ? pokemon.shiny : pokemon.sprite){ image in
                    image
                        .resizable()
                        .scaledToFit()
                        .shadow(color:.black,radius: 5)
                        .padding(.top,50)
                } placeholder: {
                    ProgressView()
                }
            }
            HStack{
                Text("\(pokemon.shiny!)")
                ForEach(pokemon.types!, id: \.self){ type in
                    Text(type.capitalized)
                        .font(.title2)
                        .shadow(color:.white,radius: 1)
                        .padding([.leading,.trailing])
                        .padding([.top,.bottom],7)
                        .background(Color(type.capitalized))
                        .clipShape(.rect(cornerRadius: 50))
                    
                }
                Spacer()
            }
            .padding()
            
            Text("Stats")
            
            StatsView(pokemon: pokemon)
        }
        .navigationTitle(pokemon.name!.capitalized)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing){
                Button{
                    showShiny.toggle()
                } label : {
                    if showShiny {
                        Image(systemName:"wand.and.stars")
                            .foregroundStyle(.yellow)
                    } else {
                        Image(systemName:"wand.and.stars.inverse")
                            
                    }
                    
                }
            }
        }
    }
}

#Preview {

    PokemonDetailView()
        .environmentObject(SamplePokemon.samplePokemon!)
}

