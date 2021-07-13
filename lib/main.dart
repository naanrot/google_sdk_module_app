import 'package:flutter/material.dart';
import 'package:google_sdk/google_sdk.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(environment: Environment.dev);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);
  final googleSignIn = locator<GoogleSignInPackage>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sign In',
      initialRoute: googleSignIn.isSignIn() ? Routes.homePage : Routes.authView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
