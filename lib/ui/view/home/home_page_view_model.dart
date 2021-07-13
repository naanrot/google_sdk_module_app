import 'package:google_sdk/google_sdk.dart';
import 'package:google_sdk_module_app/app/app.locator.dart';
import 'package:google_sdk_module_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final googleSignPackage = locator<GoogleSignInPackage>();
  final _navigationService = locator<NavigationService>();

  void signOut() async {
    await googleSignPackage.signOut();
    _navigationService.clearStackAndShow(Routes.authView);
  }
}