// struct hexagon example:
import SwiftUI

let tubesAmount: Int = 5
let colorsAmount: Int = 5
let tileSize: CGFloat = 40

struct ContentView: View {

    @State var tubes: [[Int]] = Generator.genTubes(
        tubeNumber: tubesAmount,
        colorPerTube: colorsAmount
    )
    
    var body: some View {
        GameView(
            GameTubes: tubes,
            tubeQuantity: tubesAmount,
            colorPerTube: colorsAmount,
            colorSize: tileSize
        )
    }
}

#Preview {
    HStack(spacing: 20) {
        ContentView()
    }
}
