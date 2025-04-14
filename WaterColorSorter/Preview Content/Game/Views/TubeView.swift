//
//  TubeView.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/7/25.
//

import SwiftUI

struct TubeView: View {
    let colorStack: [Int]
    var colorSize: Int
    
    // This function will return an Color element, based on a integer (provided by the game logic)
    func colorForIndex(_ index: Int) -> Color {
        let colors: [Color] = [
            .red, .blue, .green, .yellow, .purple, .orange, .pink, .cyan,
            .mint, .teal, .indigo, .brown, .gray, .black, .white,
            Color(hue: 0.05, saturation: 0.9, brightness: 1.0),
            Color(hue: 0.3, saturation: 1.0, brightness: 0.75),
            Color(hue: 0.95, saturation: 0.8, brightness: 1.0),	
            Color(hue: 0.15, saturation: 1.0, brightness: 1.0),
            Color(hue: 0.6, saturation: 0.5, brightness: 0.8)
        ]
        return colors.indices.contains(index) ? colors[index] : .gray
    }

    var body: some View {
        VStack(spacing: 2) {
            ForEach(Array(colorStack.enumerated().reversed()), id: \.offset) { _, colorIndex in
                ColorPiece()
                    .fill(colorForIndex(colorIndex))
                    .frame(width: CGFloat(colorSize), height: CGFloat(colorSize))
            }
        }
        .padding(10)
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    HStack(spacing: 20) {
        // This is a simulation of the game logic
        TubeView(colorStack: [1, 2, 2, 1], colorSize: 50)
    }
}
