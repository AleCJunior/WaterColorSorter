//
//  ColorPiece.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/7/25.
//

import SwiftUI

//
struct ColorPiece: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // Desenha um retângulo com cantos arredondados
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: 5, height: 5))
        return path
    }
}

#Preview {
    ZStack {
        ColorPiece()
            .frame(width: 50, height: 50, alignment: .center)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
}
