# 🎨 ColorSyncApp

An iOS SwiftUI app to generate random color hex codes, display them in cards, store offline, and sync with Firebase when online.

## 🔧 Features
- Generate random hex colors
- Display colors on scrollable cards
- Store colors locally with timestamp when offline
- Sync to Firebase Firestore when online
- Automatic network detection and retry

## 🛠️ Technologies
- SwiftUI
- Firebase Firestore
- UserDefaults for offline storage
- NWPathMonitor for connectivity

## 📲 Setup
1. Clone this repo
2. Install Firebase SDK via Swift Package Manager
3. Add your `GoogleService-Info.plist` to the root of the project
4. Run on iOS 15+

## 🔗 Firebase Setup
- Use Firestore database
- Enable Firestore in your Firebase console
- Use collection name: `colors`

## 🎥 Demo
- Screen recording shows:
  - Generating color
  - Going offline and storing
  - Coming online and syncing
  - Status indicator

---

### 👤 Author
- Made by Nishit for iOS assignment
