# Google Sign-In Setup Instructions

To complete the Google Sign-In setup, you need to configure your project with Google Cloud Console and add the necessary configuration files.

## Quick Start

Your Flutter app is ready to run! However, to enable Google Sign-In functionality, you need to:

1. Set up Google Cloud Console project
2. Configure OAuth 2.0 credentials
3. Add configuration files to your project

**Current Status**: The app will run but Google Sign-In will fail until you complete the setup below.

## 1. Google Cloud Console Setup

1. Go to the [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the Google Sign-In API:
   - Go to "APIs & Services" > "Library"
   - Search for "Google Sign-In API" and enable it

## 2. Create OAuth 2.0 Credentials

### For Android:
1. In Google Cloud Console, go to "APIs & Services" > "Credentials"
2. Click "Create Credentials" > "OAuth 2.0 Client IDs"
3. Select "Android" as the application type
4. Enter your package name: `com.example.google_authentication`
5. Get your SHA-1 certificate fingerprint:
   ```bash
   # For debug keystore (development)
   keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
   
   # For Windows (debug keystore)
   keytool -list -v -keystore %USERPROFILE%\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android
   ```
6. Enter the SHA-1 fingerprint in the console
7. Click "Create"

### For iOS:
1. Create another OAuth 2.0 Client ID
2. Select "iOS" as the application type
3. Enter your bundle identifier: `com.example.googleAuthentication`
4. Click "Create"

### For Web (if needed):
1. Create another OAuth 2.0 Client ID
2. Select "Web application" as the application type
3. Add authorized origins if needed
4. Click "Create"

## 3. Download Configuration Files

### For Android:
1. Download the `google-services.json` file
2. Place it in `android/app/google-services.json`

### For iOS:
1. Download the `GoogleService-Info.plist` file
2. Place it in `ios/Runner/GoogleService-Info.plist`

## 4. Configure Web Platform

For web platform, update the client ID in `web/index.html`:

1. Open `web/index.html`
2. Find the line: `<meta name="google-signin-client_id" content="YOUR_GOOGLE_CLIENT_ID.apps.googleusercontent.com">`
3. Replace `YOUR_GOOGLE_CLIENT_ID` with your actual web client ID from Google Cloud Console

Alternatively, you can set the client ID directly in the code:

1. Open `lib/services/google_auth_service.dart`
2. Uncomment and update the `clientId` parameter:
   ```dart
   static final GoogleSignIn _googleSignIn = GoogleSignIn(
     scopes: ['email', 'profile'],
     clientId: 'YOUR_ACTUAL_CLIENT_ID.apps.googleusercontent.com',
   );
   ```

## 5. Update Android Configuration

Add the Google Services plugin to your Android configuration:

1. In `android/build.gradle.kts`, add to dependencies:
   ```kotlin
   dependencies {
       classpath("com.google.gms:google-services:4.4.0")
   }
   ```

2. In `android/app/build.gradle.kts`, add at the top:
   ```kotlin
   plugins {
       id("com.google.gms.google-services")
   }
   ```

## 6. Update iOS Configuration

1. Open `ios/Runner.xcworkspace` in Xcode
2. Right-click on "Runner" in the project navigator
3. Select "Add Files to Runner"
4. Select the `GoogleService-Info.plist` file
5. Make sure it's added to the Runner target

## 7. Test the Application

Run the application:
```bash
flutter run
```

## Troubleshooting

### Common Issues:

1. **"Sign in failed" error**: Make sure your SHA-1 fingerprint is correct and the package name matches
2. **"Network error"**: Check your internet connection and API key configuration
3. **"Invalid client"**: Verify that your OAuth 2.0 client ID is correctly configured

### Debug Commands:

```bash
# Get SHA-1 for debug keystore
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

## Optional: Add Google Logo

To add the Google logo to the sign-in button:
1. Download the Google logo from [Google Brand Resource Center](https://about.google/brand-resource-center/)
2. Save it as `assets/images/google_logo.png`
3. The app will automatically use it in the sign-in button

## Security Notes

- Never commit your `google-services.json` or `GoogleService-Info.plist` files to public repositories
- Use different OAuth clients for debug and release builds
- Consider adding these files to your `.gitignore`