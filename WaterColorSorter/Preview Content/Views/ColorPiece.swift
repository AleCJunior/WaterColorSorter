//
//  ColorPiece.swift
//  WaterColorSorter
//
//  Created by user272782 on 4/7/25.
//

import SwiftUI

struct ColorPiece: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {
            path in
            let p1 = CGPoint(x:0, y:50)
            let p2 = CGPoint(x:50, y:50)
            let p3 = CGPoint(x: 50, y: 0)
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
    ColorPiece()
}
