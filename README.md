# KumbhConn

An attendee-facing Android app for large gatherings that enables one-tap SOS, structured incident reporting, and delivery of geotargeted advisories, with resilience under network congestion and privacy-preserving design.

## 🚀 Features

### Core Functionality
- **One-tap SOS** - Emergency assistance with prominent red button
- **Structured Incident Reporting** - 2-step flow with category selection and detailed forms
- **Geotargeted Advisories** - Zone-specific alerts and updates
- **Offline-first Design** - Works without internet connectivity
- **Privacy-preserving** - Minimal data collection and local-first approach

### App Sections
- **Home/SOS** - Emergency interface with status indicators
- **Feed** - Real-time advisories, transport updates, and personal status
- **Map** - Venue navigation with POI markers (placeholder)
- **Report Incident** - Comprehensive incident reporting system

## 📱 Screenshots

*Screenshots will be added here*

## 🛠️ Tech Stack

- **Framework**: Flutter 3.35.3
- **Platform**: Android (primary), Web support
- **Backend**: Firebase (planned)
  - Authentication
  - Firestore Database
  - Cloud Storage
  - FCM Push Notifications
  - Remote Config
  - Cloud Functions
- **Maps**: MapLibre GL (planned integration)
- **State Management**: Flutter StatefulWidget
- **UI**: Material Design 3

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.35.3 or higher
- Android Studio with Android SDK
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/kumbhconn.git
   cd kumbhconn
   ```

2. **Install dependencies**
   ```bash
   cd kumbhconn_app
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run
   
   # For Web
   flutter run -d chrome
   ```

### Building APK

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release
```

## 📁 Project Structure

```
kumbhconn/
├── kumbhconn_app/           # Flutter app
│   ├── lib/
│   │   └── main.dart       # Main app file with all screens
│   ├── android/            # Android-specific files
│   ├── ios/               # iOS-specific files
│   ├── web/               # Web-specific files
│   └── pubspec.yaml       # Dependencies
├── README.md              # This file
└── .gitignore            # Git ignore rules
```

## 🎯 App Flow

### 1. Authentication
- Aadhaar-based login (placeholder)
- Clean, minimal login interface

### 2. Home/SOS Screen
- Prominent SOS button for emergencies
- Status chips (Location, Battery, Network)
- Report Incident button
- Zone status indicator

### 3. Report Incident Flow
- **Step 1**: Category selection (Health, Security, Transport)
- **Step 2**: Detailed form with location, description, media
- Severity selection and structured data collection

### 4. Feed Tab
- Personal status cards
- Zone-specific advisories
- Transport updates
- Health & WASH alerts
- Filter by category and priority

### 5. Map Tab
- Venue navigation (placeholder)
- POI markers for facilities
- Guide me routing
- Find-me functionality

## 🔧 Configuration

### Android Permissions
The app requires location permissions for emergency services:
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

### Environment Setup
- Flutter SDK installed and on PATH
- Android SDK with API level 34+
- Android emulator or physical device

## 🚧 Development Status

### ✅ Completed
- [x] Basic app structure
- [x] Login screen with Aadhaar placeholder
- [x] SOS home interface
- [x] Report incident 2-step flow
- [x] Feed tab with advisories
- [x] Map tab placeholder
- [x] Navigation between screens
- [x] APK build configuration

### 🚧 In Progress
- [ ] Firebase integration
- [ ] Real map implementation
- [ ] Aadhaar authentication
- [ ] Offline data caching

### 📋 Planned
- [ ] Push notifications
- [ ] Real-time location tracking
- [ ] Voice reporting
- [ ] Multi-language support
- [ ] Accessibility features

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support and questions:
- Create an issue in this repository
- Contact: [your-email@example.com]

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI guidelines
- Firebase for backend services
- Open source community

---

**Built with ❤️ for large gathering safety and emergency response**
