//
//  Pokemon+Ext.swift
//  Dex3
//
//  Created by Shreyas Sahoo on 17/04/24.
//

import Foundation

extension Pokemon {
    var background : String {
        switch self.types![0] {
        case "normal","grass","electric","poison","fairy":
            return "normalgrasselectricpoisonfairy"
        case "rock","ground","steel","fighting","ghost","dark","psychic":
            return "groundsteelfightingghostdarkpsychic"
        case "fire","dragon" :
            return "firedragon"
        case "flying","bug" :
            return "flyingbug"
        case "ice" :
            return "ice"
        case "water" :
            return "water"
        default:
          return "default"
        }
    }
    
    var stats : [Stat] {
        [
            Stat(id: 1, label: "HP", value: Int(self.hp)),
            Stat(id: 2, label: "Attack", value: Int(self.attack)),
            Stat(id: 3, label: "Defense", value: Int(self.defense)),
            Stat(id: 4, label: "Special Attack", value: Int(self.specialAttack)),
            Stat(id: 5, label: "Special Defense", value: Int(self.specialDefense)),
            Stat(id: 6, label: "Speed", value: Int(self.speed)),
        ]
    }
    
    var highestStat : Stat {
        stats.max{$0.value < $1.value}!
    }
    struct Stat : Identifiable {
        let id : Int
        let label : String
        let value : Int
    }
}
