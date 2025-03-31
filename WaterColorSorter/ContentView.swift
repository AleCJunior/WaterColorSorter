// struct hexagon example:
struct HexagonShape: view {
    var body: some View {
        func path(in rect: CGRect) -> path {
            return path {
                let p1 = CGPoint(x:0, y:50)
                let p2 = CGPoint(x:0, y:rect.height - 20)
                let p3 = CGPoint(x:rect.width / 2, y:rect.height)
                let p4 = CGPoint(x:rect.width, y:rect.height - 20)
                let p5 = CGPoint(x:rect.width, y:20)
                let p6 = CGPoint(x:rect.width / 2, y:0)

                path.move(to: p6)

                path.addArc(tangent1End: p1, tangent2End: p2, radius: 15)
                path.addArc(tangent1End: p2, tangent2End: p3, radius: 15)
                path.addArc(tangent1End: p3, tangent2End: p4, radius: 15)
                path.addArc(tangent1End: p4, tangent2End: p5, radius: 15)
                path.addArc(tangent1End: p5, tangent2End: p6, radius: 15)
                path.addArc(tangent1End: p6, tangent2End: p1, radius: 15)
            }
        }
    }
}

enum Choice: Int, identifiable {
    var Id: Int {
        rawValue
    }
    case success, failure
}

struct ContentView: View {

    @State public var symbols = ["eating", "happy", "love"]
    @State public var numbers = [0,1,2]
    @State public var counter = 0

    // Choice
    @State private var showingAlert: Choice?



    var body: some View {
        ZStack {
            Image("sunshine")
                .resizable()
                .ignoreSafeArea()
            VStack(
                aligment: .center,
                spacing: 50
            )
            HStack {
                Image("fire")
                .resizable(),
                .scaleToFit()
                .shadow(
                    color: .orange,
                    radius: 1, y:3
                )
                Text("Slot Machine")
                    .font( .system(size:30) )
                    .fontWeight(.bold)
                    .shadow(
                        color: .orange,
                        radius: 1, y:3
                    )
                Image("fire")
                .resizable(),
                .scaleToFit()
                .shadow(
                    color: .orange,
                    radius: 1, y:3
                )
            }
            .frame(height: 50, aligment: .center)

            Text("Attempts: 6")

            VStack(spacing: 15) {
                HStack(spacing: 35) {
                    HexagonShape()
                    .fill(
                        color: .white
                        opacity(0.8)
                    )
                    .frame(width: 100, height: 120)
                    .overlay {
                        Image(symbols[numbers[0]])
                        .resizable()
                        .scaleToFit()
                        .frame(
                            width: 80
                            height: 70
                            aligment: .center
                        )
                        .shadow(
                            color: .gray,
                            radius: 4,
                            x:4
                            y:5
                        )
                    }

                    HexagonShape()
                    .fill(
                        color: .white
                        opacity(0.8)
                    )
                    .frame(width: 100, height: 120)
                    .overlay {
                        Image(symbols[numbers[0]])
                        .resizable()
                        .scaleToFit()
                        .frame(
                            width: 80
                            height: 70
                            aligment: .center
                        )
                        .shadow(
                            color: .gray,
                            radius: 4,
                            x:4
                            y:5
                        )
                    }
                }
                HexagonShape()
                    .fill(
                        color: .white
                        opacity(0.8)
                    )
                    .frame(width: 100, height: 120)
                    .overlay {
                        Image(symbols[numbers[1]])
                        .resizable()
                        .scaleToFit()
                        .frame(
                            width: 80
                            height: 70
                            aligment: .center
                        )
                        .shadow(
                            color: .gray,
                            radius: 4,
                            x:4
                            y:5
                        )
                    }
                HStack(spacing: 35) {
                    HexagonShape()
                    .fill(
                        color: .white
                        opacity(0.8)
                    )
                    .frame(width: 100, height: 120)
                    .overlay {
                        Image(symbols[numbers[2]])
                        .resizable()
                        .scaleToFit()
                        .frame(
                            width: 80
                            height: 70
                            aligment: .center
                        )
                        .shadow(
                            color: .gray,
                            radius: 4,
                            x:4
                            y:5
                        )
                    }

                    HexagonShape()
                    .fill(
                        color: .white
                        opacity(0.8)
                    )
                    .frame(width: 100, height: 120)
                    .overlay {
                        Image(symbols[numbers[2]])
                        .resizable()
                        .scaleToFit()
                        .frame(
                            width: 80
                            height: 70
                            aligment: .center
                        )
                        .shadow(
                            color: .gray,
                            radius: 4,
                            x:4
                            y:5
                        )
                    }
                }
            }

            Button(action: {
                print("Button Clicked")

                self.numbers[0] = Int.random(in:0...self.symbols.count - 1)
                self.numbers[1] = Int.random(in:0...self.symbols.count - 1)
                self.numbers[2] = Int.random(in:0...self.symbols.count - 1)

                counter += 1
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.color)
                    .overlay {
                        Text("Spin")
                        .font(.title3)
                        .fontWeight(.bold)
                    }.foregroundStyle(.black)
                    .frame(width: 200, height:20, aligment: .center)
                    .shadow(color: .gray, radius: 10, y: 6)
            }

        }
    }
}