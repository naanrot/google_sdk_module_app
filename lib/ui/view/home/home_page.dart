import 'package:flutter/material.dart';
import 'package:google_sdk/google_sdk.dart';
import 'package:google_sdk_module_app/ui/view/home/home_page_view_model.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, viewModel, widget) {
          return Column(
            children: [
              Text("Hi User ${GoogleSignInPackage.getCurrentUser?.displayName}"),
              TextButton(
                onPressed: () {
                  viewModel.signOut();
                },
                child: Text("Sign Out"),
              ),
            ],
          );
        },
        viewModelBuilder: () => HomeViewModel(),
      ),
    );
  }
}
