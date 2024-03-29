//
//  main.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Foundation

var xogsnim = Profile(for: "Xogsnim", on: .PSN)
sleep(10)

Selector.playerProfile = xogsnim
Selector.conditions = GameConditions(map: .Hanamura, mode: .Assault, side: .Attack)
Selector.typeOfQueue = .Damage

Selector.enemies = [
    HeroCollection[.Tracer],
    HeroCollection[.Mercy],
    HeroCollection[.Winston],
    HeroCollection[.Junkrat]
]

Selector.allies = [
    HeroCollection[.Orisa],
    HeroCollection[.Roadhog],
    HeroCollection[.Mercy]
]



let options = Selector.rankedHeroes
let sortedByScore = options.sorted(by: { $0.value.score > $1.value.score })
let topFive = sortedByScore.prefix(5)
for (hero, score) in topFive {
    print(hero.name, score.score, score.log["DPS"] ?? 0)
}

print(HeroCollection.SelectBy(role: .Support).map {$0.name} )
