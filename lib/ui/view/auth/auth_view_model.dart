import 'package:google_sdk/google_sdk.dart';
import 'package:google_sdk_module_app/app/app.locator.dart';
import 'package:google_sdk_module_app/app/app.router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final _googleSignInPackage = locator<GoogleSignInPackage>();
  final _navigationService = locator<NavigationService>();
  GoogleSignInAccount? currentUser;
  bool isAuthenticating = false;

  void signIn() async {
    //print("Inside auth view model ${_googleSignInPackage.isSignIn()}");
    isAuthenticating = true;
    notifyListeners();

    try {
      currentUser = await _googleSignInPackage.signIn();
    } catch (e) {
      print("Error $e");
      currentUser = null;
    }

    if (currentUser != null)
      _navigationService.clearStackAndShow(Routes.homePage);
    else {
      isAuthenticating = false;
      notifyListeners();
    }
  }

  void signOut() async {
    await _googleSignInPackage.signOut();
    print("User signed out");
    notifyListeners();
  }
}
