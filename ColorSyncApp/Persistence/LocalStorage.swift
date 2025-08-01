import Foundation

struct LocalStorage {
    private static let key = "savedColors"

    static func save(colors: [ColorModel]) {
        if let data = try? JSONEncoder().encode(colors) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    static func load() -> [ColorModel] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let colors = try? JSONDecoder().decode([ColorModel].self, from: data) else {
            return []
        }
        return colors
    }
}
