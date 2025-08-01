import Foundation

struct ColorModel: Identifiable, Codable {
    var id: String
    var hexCode: String
    var timestamp: Date
    var synced: Bool = false
}
