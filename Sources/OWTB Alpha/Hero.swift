//
//  Hero.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa

/**
 Represented by N x N mairix, that shows synergy relationship beetwen each hero
 
 Numbers in matrix means the strength of synergy and can take value from 0 to 2. Value of zero means that heroes have no synergy. Value of two means that heroes have the strongest synergy.
 */
var synergyMatrix: [[Int]] = [
    [ 0,0,0,0,0, 0,0,0,10,20, 0,0,15,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0 ],
    [ 0,0,0,0,10, 0,0,0,0,0, 0,0,25,0,0, 0,0,0,0,0, 0,25,0,0,0, 0,25,0,0,0 ],
    [ 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0 ],
    [ 0,0,0,0,0, 45,0,0,0,30, 0,0,10,0,0, 0,0,0,0,0, 0,15,0,0,0, 0,0,0,0,0 ],
    [ 0,10,0,0,0, 25,30,0,0,10, 45,0,10,10,15, 10,0,15,0,0, 0,15,0,0,0, 15,20,0,10,15 ],

    [ 0,0,0,45,25, 0,0,0,30,0, 45,0,20,10,10, 0,10,15,25,0, 10,0,10,25,10, 0,0,20,10,0 ],
    [ 0,0,0,0,30, 0,0,0,10,0, 0,10,0,0,0, 0,0,0,0,0, 0,0,0,45,0, 0,0,0,0,0 ],
    [ 0,0,0,0,0, 0,0,0,0,0, 0,0,15,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0 ],
    [ 10,0,0,0,0, 30,10,0,0,10, 0,0,15,0,10, 15,0,0,0,0, 0,15,0,0,0, 0,20,0,0,10 ],
    [ 20,0,0,30,10, 0,0,0,10,0, 15,0,0,10,0, 0,10,10,15,0, 25,0,10,15,10, 0,10,15,10,0 ],

    [ 0,0,0,0,45, 45,0,0,0,15, 0,10,10,0,0, 10,0,0,0,0, 0,15,0,40,0, 15,10,0,0,20 ],
    [ 0,0,0,0,0, 0,10,0,0,0, 10,0,0,0,0, 0,0,0,0,0, 0,0,0,10,0, 0,0,0,0,0 ],
    [ 15,25,0,10,10, 20,0,15,15,0, 10,0,0,0,0, 5,5,5,5,0, 0,10,0,5,5, 0,10,5,5,10 ],
    [ 0,0,0,0,10, 10,0,0,0,10, 0,0,0,0,0, 5,0,0,0,0, 0,0,0,0,0, 0,5,0,0,10 ],
    [ 0,0,0,0,15, 10,0,0,10,0, 0,0,0,0,0, 0,0,0,10,0, 5,0,0,15,0, 0,0,0,0,10 ],

    [ 0,0,0,0,10, 0,0,0,15,0, 10,0,5,5,0, 0,0,10,10,0, 10,0,5,10,10, 0,5,10,10,0 ],
    [ 0,0,0,0,0, 10,0,0,0,10, 0,0,5,0,0, 0,0,0,0,0, 0,20,5,0,0, 5,0,10,0,15 ],
    [ 0,0,0,0,15, 15,0,0,0,10, 0,0,5,0,0, 10,0,0,0,0, 0,10,0,0,0, 10,10,0,0,15 ],
    [ 0,0,0,0,0, 25,0,0,0,15, 0,0,5,0,10, 10,0,0,0,0, 0,10,0,0,0, 10,5,0,0,10 ],
    [ 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,5,0,10, 0,0,0,5,0 ],

    [ 0,0,0,0,0, 10,0,0,0,25, 0,0,0,0,5, 10,0,0,0,0, 0,5,0,0,0, 5,5,0,0,5 ],
    [ 0,25,0,15,15, 0,0,0,15,0, 15,0,10,0,0, 0,20,10,10,0, 5,0,0,10,5, 0,5,10,10,0 ],
    [ 0,0,0,0,0, 10,0,0,0,10, 0,0,0,0,0, 5,5,0,0,5, 0,0,0,0,0, 5,5,0,0,5 ],
    [ 0,0,0,0,0, 25,45,0,0,15, 40,10,5,0,15, 10,0,0,0,0, 0,10,0,0,0, 10,10,0,0,10 ],
    [ 0,0,0,0,0, 10,0,0,0,10, 0,0,5,0,0, 10,0,0,0,10, 0,5,0,0,0, 5,5,0,0,5 ],

    [ 0,0,0,0,15, 0,0,0,0,0, 15,0,0,0,0, 0,5,10,10,0, 5,0,5,10,5, 0,0,10,10,0 ],
    [ 0,25,0,0,20, 0,0,0,20,10, 10,0,10,5,0, 5,0,10,5,0, 5,5,5,10,5, 0,0,10,5,5 ],
    [ 0,0,0,0,0, 20,0,0,0,15, 0,0,5,0,0, 10,10,0,0,0, 0,10,0,0,0, 10,10,0,0,10 ],
    [ 0,0,0,0,10, 10,0,0,0,10, 0,0,5,0,0, 10,0,0,0,5, 0,10,0,0,0, 10,5,0,0,10 ],
    [ 0,0,0,0,15, 0,0,0,10,0, 20,0,10,10,10, 0,15,15,10,0, 5,0,5,10,5, 0,5,10,10,0 ]
]

var counterMatrix: [[Int]] = [
    //horisontally: who is countering
    //vertically: who is being countered
    [0,0,0,0,0, 0,0,2,0,2, 1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0],
    [0,0,0,0,2, 0,0,0,2,2, 0,0,1,0,0, 0,2,0,1,0, 0,0,1,1,0, 0,0,1,0,0],
    [0,0,0,2,0, 0,2,1,0,0, 1,0,0,1,0, 0,0,2,0,1, 0,0,0,0,0, 0,0,0,0,0],
    [1,2,0,0,2, 0,0,0,0,0, 0,2,2,0,0, 0,0,2,0,1, 1,0,0,0,2, 0,2,0,0,0],
    [0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0],

    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0],
    [1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0],
    [0,0,0,0,0, 0,2,0,0,0, 1,0,0,0,0, 0,0,0,0,0, 0,0,1,1,0, 0,0,0,0,0],
    [0,0,1,0,0, 0,0,0,0,2, 0,2,0,1,0, 0,0,0,0,0, 2,1,0,0,0, 0,0,0,0,0],
    [0,0,0,0,0, 0,0,0,0,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0],

    [0,0,0,0,2, 0,0,0,2,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0],
    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0],
    [0,0,0,0,0, 0,2,0,0,0, 0,0,0,0,0, 0,1,1,2,1, 2,0,0,0,0, 0,0,0,0,0],
    [2,0,0,2,0, 1,0,0,0,0, 0,1,0,0,0, 2,0,0,0,0, 0,0,1,0,1, 0,0,0,0,0],
    [0,0,0,1,0, 0,2,0,0,0, 1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,0],

    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0],
    [0,0,0,0,0, 0,0,0,2,0, 1,0,0,1,1, 1,0,0,0,0, 0,0,1,0,0, 0,0,1,0,0],
    [1,1,0,0,2, 0,2,0,0,0, 1,0,0,0,0, 0,0,0,1,0, 0,0,1,0,0, 0,1,0,0,0],
    [0,0,2,1,0, 2,0,2,0,0, 1,0,0,1,0, 0,0,0,0,0, 0,0,0,0,0, 1,0,0,0,0],
    [0,0,0,0,2, 0,0,0,0,0, 0,0,0,1,0, 0,2,0,1,0, 0,0,0,0,0, 0,0,1,0,0],

    [0,0,2,0,0, 2,0,2,0,0, 1,0,0,0,0, 0,0,0,0,0, 0,0,0,1,0, 0,0,0,0,0],
    [0,0,0,1,0, 0,1,0,0,1, 1,0,0,0,0, 1,0,0,0,0, 0,0,0,0,0, 1,0,1,0,0],
    [2,0,0,0,1, 0,0,0,0,1, 0,1,0,0,0, 1,0,0,1,0, 0,0,0,0,2, 0,1,2,0,0],
    [0,0,1,0,0, 0,1,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,0],
    [0,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,1,0, 1,0,0,0,0, 0,0,0,0,0],

    [0,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,1,0, 0,0,0,0,0],
    [1,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,1,0, 1,0,0,0,0, 0,0,2,0,0],
    [0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0],
    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0],
    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0]
]

enum Playstyle: String {
    case Flanker
    case Assault
    case Choker
    case Healer
    case DamageAbsorber
    case Sniper
}

enum Role: String {
    case Tank
    case Damage
    case Support
}

class Hero: NSObject {
    var name: String
    var number: Int
    var role: Role
    var stats: HealthStats

    var text: String = ""
    var imageId: String = ""
    
    var playstyle: Playstyle
    var abilityList: [Ability]
    var weaponList: [Weapon]
    
    var jsonName: String {
        switch name {
        case "Torbjörn": return "torbjorn"
        case "Soldier: 76": return "soldier76"
        case "Lúcio": return "lucio"
        case "D.Va": return "dva"
        case "Wrecking Ball": return "wrecking_ball"
        default: return name.lowercased()
        }
    }


    init (name: String, number: Int, abilities: [Ability], weapons: [Weapon], role: Role, playstyle: Playstyle, health: Int, shield: Int = 0, armor: Int = 0) {
        self.name = name
        self.number = number
        self.role = role
        self.stats = HealthStats(shield: shield, health: health, armor: armor)
        
        self.playstyle = playstyle
        self.abilityList = abilities
        self.weaponList = weapons
    }
    
    func HasAbility(of type: AbilityType, with tags: AbilityTag...) -> Bool {
        let selectedAbilities = abilityList.filter { $0.type == type }
        let properties = selectedAbilities.compactMap { $0.tags }
        return properties.contains(tags)
    }

    func HasRange(of type: RangeType) -> Bool {
        let ranges = weaponList.flatMap { $0.effectiveRange }
        return ranges.contains(type)
    }

    static func Synergy(between first: Hero, and second: Hero) -> Bool {
        let firstIndex = first.number - 1
        let secondIndex = second.number - 1

        return synergyMatrix[firstIndex][secondIndex] >= 20
    }

    static func Counter(for first: Hero, is second: Hero) -> Bool {
        let firstIndex = first.number - 1
        let secondIndex = second.number - 1
        
        return counterMatrix[firstIndex][secondIndex] != 0
    }
}