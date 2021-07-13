import 'package:google_sign_in/google_sign_in.dart';

enum GoogleServices {
  Email, Contacts
}

class GoogleSignInPackage {
  GoogleSignInAccount? currentUser;
  static GoogleSignInAccount? getCurrentUser;
  late GoogleSignIn _googleSignIn;

  static Future<GoogleSignInPackage> getInstance() async {
    final googleSign = GoogleSignInPackage();
    await googleSign._googleSignIn.signInSilently();
    return Future.value(googleSign);
  }

  GoogleSignInPackage({List<GoogleServices>? services}) {
    _googleSignIn = GoogleSignIn(
      scopes: _getScopes(services ?? [GoogleServices.Email]),
    );
    _googleSignIn.signInSilently();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      print("Inside GoogleSignInPackage const $account");
      currentUser = account;
      getCurrentUser = account;
    });
  }

  List<String> _getScopes(List<GoogleServices> services) {
    final scopes = <String>[];
    services.forEach((element) {
      switch (element) {
        case GoogleServices.Email: scopes.add('email');
        break;
        case GoogleServices.Contacts: scopes.add("https://www.googleapis.com/auth/contacts.readonly");
        break;
      }
    });
    return scopes;
  }

  Future<GoogleSignInAccount?> signIn() => _googleSignIn.signIn();

  Future<GoogleSignInAccount?> signOut() => _googleSignIn.disconnect();

  bool isSignIn() => _googleSignIn.currentUser != null;
}
