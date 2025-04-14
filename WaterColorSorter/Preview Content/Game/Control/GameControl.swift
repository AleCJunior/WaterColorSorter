//
//  GameControl.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/14/25.
//

import Foundation

var tubeSelectionFirst: Int = 0
var tubeSelectionSecond: Int = 0

class GameControl: ObservableObject {
    @Published var tubes: [[Int]] = Generator.genTubes(tubeNumber: 10, colorPerTube: 5)
    let tubeCapacity = 4

    static func tapReact(index: Int) {
        if (tubeSelectionFirst == 0) {
            tubeSelectionFirst = index
        }
    }
    
    func move(from sourceIndex: Int, to destinationIndex: Int) {
        
    }
}
