//
//  StatsView.swift
//  Dex3
//
//  Created by Shreyas Sahoo on 19/04/24.
//

import SwiftUI
import Charts
struct StatsView: View {
    var pokemon : Pokemon
    var body: some View {
        Chart(pokemon.stats){ stat in
            BarMark(x: .value("Value",stat.value), y: .value("Stat",stat.label))
                .annotation(position:.trailing){
                    Text("\(stat.value)")
                        .padding(.top,-5)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                }
        }
        .frame(height: 200)
        .padding([.leading,.bottom,.trailing])
        .foregroundStyle(Color(pokemon.types![0].capitalized))
        .chartXScale(domain: 0...pokemon.highestStat.value+5)
    }
}

#Preview {
    StatsView(pokemon : SamplePokemon.samplePokemon!)
}