import Foundation
import FirebaseFirestore

class FirebaseService {
    private let db = Firestore.firestore()

    /// Uploads a color to Firebase Firestore
    func uploadColor(_ color: ColorModel, completion: @escaping (Error?) -> Void) {
        let data: [String: Any] = [
            "hexCode": color.hexCode,
            "timestamp": Timestamp(date: color.timestamp)
        ]

        db.collection("colors").document(color.id).setData(data) { error in
            completion(error)
        }
    }
}
