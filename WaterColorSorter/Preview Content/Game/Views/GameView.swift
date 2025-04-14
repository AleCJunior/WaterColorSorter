//
//  GameView.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/7/25.
//

import SwiftUI

struct GameView: View {
    var GameTubes: [[Int]]
    
    var tubeQuantity: Int
    var colorPerTube: Int
    var colorSize: CGFloat
    var maxTubesPerLine = 6

    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<numberOfRows(), id: \.self) { rowIndex in
                HStack(spacing: 10) {
                    let start = rowIndex * maxTubesPerLine
                    let end = min(start + maxTubesPerLine, GameTubes.count)
                    ForEach(start..<end, id: \.self) { index in
                        TubeView(colorStack: GameTubes[index], colorSize: 20)
                            .onTapGesture {
                                GameControl.tapReact(index: index)
                            }
                    }
                }
            }
        }
        .padding()
    }
    
    private func numberOfRows() -> Int {
        return Int(ceil(Double(GameTubes.count) / Double(maxTubesPerLine)))
    }
}

#Preview {
    GameView(
        GameTubes: [
            [1,2,3], [2,1,3], [3,2,1],
            [1,1,1], [2,2,2], [3,3,3],
            [1,2,1], [3,3,2], [2,2,1],
            [1,3,2], [3,1,2], [2,1,3],
            [3,1,1]
        ],
        tubeQuantity: 13,
        colorPerTube: 3,
        colorSize: 25
    )
}
