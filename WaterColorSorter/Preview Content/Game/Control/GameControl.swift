//
//  GameControl.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/14/25.
//

import Foundation

class GameState: ObservableObject {
    @Published var tubes: [Tube] = Generator.genTubes(tubeNumber: 10, colorPerTube: 5)
    let tubeCapacity = 4

    func move(from sourceIndex: Int, to destinationIndex: Int) {
        // Implementar lógica para mover a cor do topo de um tubo para outro
        // Verificar se a movimentação é válida conforme as regras do jogo
    }
}
