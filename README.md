# 🌙 إسلامونا — Islamona

> A comprehensive Islamic mobile application built with **Flutter & Dart**, featuring prayer times, athkar, tasbih counter, and more — designed with a clean, modern dark UI.

---

## 📱 Screenshots

| Splash Screen | Prayer Times | Athkar | Morning Athkar | Tasbih |
|---|---|---|---|---|
| ![Splash](screenshots/preview4.png) | ![Prayer](screenshots/preview.png) | ![Athkar](screenshots/preview2.png) | ![Morning](screenshots/preview3.png) | ![Tasbih](screenshots/preview5.png) |

---

## ✨ Features

### 🕌 Prayer Times
- Real-time prayer times based on device location
- Live countdown timer to next prayer
- All 5 daily prayers displayed (Fajr, Dhuhr, Asr, Maghrib, Isha)
- Hijri (Islamic) calendar date display
- Location detection (Africa/Cairo and more)

### 📿 Athkar (أذكار)
- **أذكار الصباح** — Morning Athkar with repetition counter
- **أذكار المساء** — Evening Athkar
- **أذكار الصلاة** — Prayer Athkar
- **أذكار النوم** — Sleep Athkar
- **الرقية الشرعية** — Ruqyah
- **أدعية متنوعة** — Various Duas
- Beautiful category images for each section
- Individual repetition tracking per dhikr

### 📿 Tasbih Counter (تسبيح)
- Digital tasbih counter
- Reset functionality
- Clean minimalist design

### 🎨 UI/UX
- Modern dark theme
- Arabic RTL support
- Clean card-based layout
- Custom splash screen with animated logo
- Green color scheme inspired by Islamic tradition

---

## 🛠️ Tech Stack

| Technology | Usage |
|---|---|
| **Flutter** | Cross-platform mobile framework |
| **Dart** | Programming language |
| **Flutter Plugins** | Location, prayer times calculation |
| **Material Design** | UI components |

---

## 📁 Project Structure

```
islamona/
├── lib/                    # Main Dart source code
│   ├── main.dart           # App entry point
│   ├── screens/            # App screens
│   │   ├── home_screen.dart
│   │   ├── athkar_screen.dart
│   │   ├── tasbih_screen.dart
│   │   └── prayer_times_screen.dart
│   └── widgets/            # Reusable widgets
├── assets/                 # Images and assets
├── android/                # Android platform files
├── ios/                    # iOS platform files
├── web/                    # Web platform files
└── pubspec.yaml            # Dependencies
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK
- Android Studio / VS Code
- Android or iOS device/emulator

### Installation

```bash
# Clone the repository
git clone https://github.com/Marwan-Makram/islamona.git
cd islamona

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Build APK

```bash
flutter build apk --release
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  # Add your main dependencies here
  # e.g., adhan, geolocator, etc.
```

See `pubspec.yaml` for full dependency list.

---

## 🌍 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Linux
- ✅ macOS
- ✅ Windows
- ✅ Web

---

## 🤲 About This Project

Islamona was built as a personal project to help Muslims with their daily Islamic practices — from prayer times to morning and evening athkar. The app is designed to be simple, beautiful, and easy to use.

---

## 👨‍💻 Developer

**Marwan Elsayed**
IT Support Engineer & Mobile Developer
- LinkedIn: [linkedin.com/in/marwan-makram-683630b2](https://linkedin.com/in/marwan-makram-683630b2)
- GitHub: [github.com/Marwan-Makram](https://github.com/Marwan-Makram)
- Email: marawanmakram159@gmail.com

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
