import SwiftUI

struct ColorCardView: View {
    let hexCode: String

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color(hex: hexCode))
                .frame(height: 150)
                .cornerRadius(15)
                .overlay(Text(hexCode)
                            .foregroundColor(.white)
                            .bold()
                            .shadow(radius: 5))
        }
        .padding()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
