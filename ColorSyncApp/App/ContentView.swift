import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ColorViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Status: \(viewModel.isOnline ? "🟢 Online" : "🔴 Offline")")
                        .font(.caption)
                        .padding(.leading)
                    Spacer()
                }

                Button(action: {
                    viewModel.generateColor()
                }) {
                    Text("Generate Color")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                ScrollView {
                    ForEach(viewModel.colors.reversed()) { color in
                        ColorCardView(hexCode: color.hexCode)
                    }
                }

                Spacer()
            }
            .navigationTitle("Color Generator")
        }
    }
}
