//
//  TubeView.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/7/25.
//

import SwiftUI

struct TubeView: View {
    let colorStack: [Int]

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
                    .frame(width: 50, height: 50)
            }
        }
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
    }
}

struct ColorPiece: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let p1 = CGPoint(x:0, y:rect.height)
            let p2 = CGPoint(x:rect.width, y:rect.height)
            let p3 = CGPoint(x: rect.width, y: 0)
            let p4 = CGPoint(x: 0, y: 0)

            path.move(to: p4)

            path.addArc(tangent1End: p1, tangent2End: p2, radius: 5)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 5)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 5)
            path.addArc(tangent1End: p4, tangent2End: p1, radius: 5)
        }
    }
}

#Preview {
    HStack(spacing: 20) {
        TubeView(colorStack: [1, 2, 2, 1])
        TubeView(colorStack: [3, 3, 3])
        TubeView(colorStack: [4, 5, 4, 2, 1])
    }
}
