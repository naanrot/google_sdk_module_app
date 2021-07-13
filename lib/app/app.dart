
import 'package:google_sdk/google_sdk.dart';
import 'package:google_sdk_module_app/ui/view/home/home_page.dart';
import 'package:google_sdk_module_app/ui/view/auth/auth_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: AuthView),
    MaterialRoute(page: HomePage)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService,),
    Presolve(
      classType: GoogleSignInPackage,
      presolveUsing: GoogleSignInPackage.getInstance
    )
  ]
)
class App{}