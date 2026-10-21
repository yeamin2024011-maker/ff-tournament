# FF Tournament — Starter Project

Flutter starter scaffold for Android APK + Web App.

Includes:
- Tournament listing with Solo, Duo, Squad examples
- Registration UI for phone, password, Free Fire name and UID
- bKash/Nagad manual payment submission UI
- Two-admin panel structure
- Firestore security rules template
- Production checklist

IMPORTANT: This is a UI/source starter, not a live production app. SMS OTP, real database writes, payment verification, admin authorization, hosting and APK signing require configuration and testing. Do not use it to collect real payments until backend security and payment instructions are implemented.

## Run
1. Install Flutter SDK.
2. Run `flutter create ff_tournament`.
3. Copy this project's `lib/` and `pubspec.yaml` into the generated project.
4. Run `flutter pub get`.
5. Configure Firebase using FlutterFire CLI and enable Phone Authentication.
6. Run `flutter run -d chrome` for web or `flutter run` on a connected Android device.

Admin roles must be assigned securely server-side, never by a client-side toggle. For real bKash/Nagad automatic verification, obtain authorized merchant/API access.
