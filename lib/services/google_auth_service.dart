import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  // For web platform, you can also pass the clientId directly here
  // Replace with your actual Google OAuth 2.0 client ID
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    // Uncomment and replace with your client ID for web platform
    // clientId: 'YOUR_GOOGLE_CLIENT_ID.apps.googleusercontent.com',
  );

  // Sign in with Google
  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      return account;
    } catch (error) {
      print('Error signing in with Google: $error');
      return null;
    }
  }

  // Sign out
  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      print('Error signing out: $error');
    }
  }

  // Get current user
  static GoogleSignInAccount? getCurrentUser() {
    return _googleSignIn.currentUser;
  }

  // Check if user is signed in
  static bool isSignedIn() {
    return _googleSignIn.currentUser != null;
  }
}
