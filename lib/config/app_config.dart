// App Configuration
// This file contains configuration constants for the app

class AppConfig {
  // Google Sign-In Configuration
  // Replace these with your actual Google OAuth 2.0 client IDs

  // Web Client ID (for web platform)
  static const String googleWebClientId =
      'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com';

  // Android Client ID (usually not needed as it's in google-services.json)
  static const String googleAndroidClientId =
      'YOUR_ANDROID_CLIENT_ID.apps.googleusercontent.com';

  // iOS Client ID (usually not needed as it's in GoogleService-Info.plist)
  static const String googleIosClientId =
      'YOUR_IOS_CLIENT_ID.apps.googleusercontent.com';

  // App Information
  static const String appName = 'Google Authentication Demo';
  static const String appVersion = '1.0.0';

  // You can add more configuration constants here as needed
}
