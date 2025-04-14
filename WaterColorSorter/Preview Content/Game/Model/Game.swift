//
//  Game.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/7/25.
//

import Foundation

class Game {
        static func canMove(firstTube: Tube, secondTube: Tube) -> Bool {
        let printResults = true
        let printIndexes = false
        let printValues = true
        var canMove: Bool
        if (secondTube.color[3] == 0) {
            canMove = true
        }
        var colorLenght: Int = 1
        var firstColor: Int = firstTube.color[0]
        // Identify how many colorUnits we have on the top
        // Ex: [3, 3, 2, 1] results in colorLenght: 2
        for i in 1..<firstTube.color.count {
            if (firstColor != firstTube.color[i]) {
                colorLenght = i
                break
            }
        }
        
        var secondColor: Int = 0
        var spaceAmount: Int = 0
        
        for i in 0..<secondTube.color.count {
            if (secondTube.color[i] == 0) {
                spaceAmount += 1
            }
            else {
                secondColor = secondTube.color[i]
                break
            }
        }
        if (((firstColor == secondColor) || (secondColor == 0)) && (spaceAmount > 0)) {
            canMove = true
        }
        else {
            canMove = false
        }
        
        print(canMove)
        
        if (!canMove) {
            return false
        }
        var transferAmount: Int
        if (colorLenght > spaceAmount) {
            transferAmount = colorLenght - spaceAmount
        }
        else {
            transferAmount = colorLenght
        }

        for i in (0..<secondTube.color.count).reversed() {
            if (printIndexes) { print("secondTube, index i: \(i)") }
            
            if (secondTube.color[i] == 0) {
                var secondColorTransferIdx: Int
                for j in (0..<transferAmount) {
                    secondColorTransferIdx = i - j
                    if (printIndexes) { print("secondTube, index j: \(secondColorTransferIdx)") }
                    
                    secondTube.color[secondColorTransferIdx] = firstColor
                }
                break
            }
        }
        
        for i in (0..<firstTube.color.count) {
            if (printIndexes) { print("firstTube, index i: \(i)") }
            
            if (firstTube.color[i] == firstColor) {
                for j in (i..<transferAmount + i) {
                    if (printIndexes) { print("firstTube, index j: \(j)") }
                    firstTube.color[j] = 0
                }
                break
            }
        }
        if (printResults) {
            print("After: ")
            print(firstTube.color)
            print(secondTube.color)
        }
        return true
    }
}
