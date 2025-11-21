// Stub replacement for removed Firebase options.
// This file used to contain generated FirebaseOptions. Since Firebase
// packages were removed to make the project front-end-only, we expose a
// minimal placeholder so code that still imports this file won't fail.

class DefaultFirebaseOptions {
  // Accessing this indicates Firebase is not configured in this build.
  static Never get currentPlatform =>
      throw UnsupportedError('Firebase has been removed in front-end-only mode.');
}
