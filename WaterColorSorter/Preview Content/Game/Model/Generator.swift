//
//  Generator.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/7/25.
//

import Foundation

class Generator {
    static func genColorUnits(tubeNumber: Int, colorPerTube: Int) -> [Int] {
        var amount: Int = tubeNumber * colorPerTube
        var colorOrder: [Int] = []
        for i in 1...tubeNumber {
            for j in 0..<colorPerTube {
                colorOrder.append(i)
            }
        }
        return colorOrder.shuffled()
    }

    static func genTubes(tubeNumber: Int, colorPerTube: Int) -> [[Int]] {
        var tubeList: [[Int]] = []
        let tubesToFill = tubeNumber - 2
        let amount: Int = tubesToFill * colorPerTube
        var indexList: [Int]
        var numberList: [Int] = genColorUnits(tubeNumber: tubeNumber, colorPerTube: colorPerTube)
        var colorIdx: Int

        for i in 0..<tubesToFill {
            var colors: [Int] = []
            for j in 0..<colorPerTube {
                colorIdx = (i * colorPerTube) + j
                colors.append(numberList[colorIdx])
            }
            tubeList.append(colors)
        }
        
        for i in 0...1 {
            tubeList.append([0, 0, 0, 0])
        }
        
        return tubeList
    }
}
