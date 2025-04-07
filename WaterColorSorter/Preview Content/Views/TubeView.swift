//
//  TubeView.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/7/25.
//

import SwiftUI

struct TubeView: View {
    let colorStack: [Int]  // Ex: [1, 5, 2, 3, 5, 1]

    // Mapeia os índices para cores
    func colorForIndex(_ index: Int) -> Color {
        let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .cyan]
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

// Peça colorida
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

// Preview para testar diferentes tubos
#Preview {
    HStack(spacing: 20) {
        TubeView(colorStack: [1, 2, 2, 1])
        TubeView(colorStack: [3, 3, 3])
        TubeView(colorStack: [4, 5, 4, 2, 1])
    }
}
