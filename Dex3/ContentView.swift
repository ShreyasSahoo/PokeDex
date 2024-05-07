//
//  ContentView.swift
//  Dex3
//
//  Created by Shreyas Sahoo on 08/04/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var pokemonVM = PokemonViewModel(controller:FetchController())

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
        animation: .default)
    private var pokedex: FetchedResults<Pokemon>
    
    
    var body: some View {
        switch pokemonVM.status {
        case .success:
            NavigationStack {
                List(pokedex) { pokemon in
                    NavigationLink(value : pokemon) {
                        
                        AsyncImage( url : pokemon.sprite ) { image in
                                image
                                .resizable()
                                .scaledToFit()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(pokemon.name!.capitalized)
                           
                        }
                    
                    
                }
                .navigationTitle("Pokedex")
                .navigationDestination(for: Pokemon.self, destination: { pokemon in
                    PokemonDetailView()
                        .environmentObject(pokemon)
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    
                }
              
            }
        case .notStarted:
            Text("not started")
        case .failed(error: let err):
            
            Text("\(err.localizedDescription)")
        default:
            ProgressView()
        }
    }

  
}



#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
