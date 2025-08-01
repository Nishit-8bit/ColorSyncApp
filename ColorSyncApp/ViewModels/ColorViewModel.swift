import Foundation
import Combine
import Network
import FirebaseFirestore

class ColorViewModel: ObservableObject {
    @Published var colors: [ColorModel] = []
    @Published var isOnline: Bool = true

    private var monitor = NetworkMonitor()
    private var db = Firestore.firestore()

    init() {
        monitor.onStatusChange = { [weak self] status in
            DispatchQueue.main.async {
                self?.isOnline = status
                if status {
                    self?.syncOfflineColors()
                }
            }
        }

        loadLocalColors()
        monitor.startMonitoring()
    }

    func generateColor() {
        let hex = String(format: "#%06X", Int.random(in: 0x000000...0xFFFFFF))
        let newColor = ColorModel(id: UUID().uuidString, hexCode: hex, timestamp: Date(), synced: false)
        colors.append(newColor)
        saveLocalColors()

        if isOnline {
            syncColorToFirebase(color: newColor)
        }
    }

    private func syncOfflineColors() {
        let unsynced = colors.filter { !$0.synced }
        for color in unsynced {
            syncColorToFirebase(color: color)
        }
    }

    private func syncColorToFirebase(color: ColorModel) {
        db.collection("colors").document(color.id).setData([
            "hexCode": color.hexCode,
            "timestamp": Timestamp(date: color.timestamp)
        ]) { [weak self] error in
            if error == nil {
                if let index = self?.colors.firstIndex(where: { $0.id == color.id }) {
                    self?.colors[index].synced = true
                    self?.saveLocalColors()
                }
            }
        }
    }

    private func saveLocalColors() {
        LocalStorage.save(colors: colors)
    }

    private func loadLocalColors() {
        colors = LocalStorage.load()
    }
}
