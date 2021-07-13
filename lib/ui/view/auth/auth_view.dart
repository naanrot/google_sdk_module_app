import 'package:flutter/material.dart';
import 'package:google_sdk_module_app/ui/view/auth/auth_view_model.dart';
import 'package:stacked/stacked.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth"),
      ),
      body: ViewModelBuilder<AuthViewModel>.reactive(
        builder: (context, viewModel, widget) {
          return viewModel.isAuthenticating
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        viewModel.signIn();
                      },
                      child: Text("Sign in"),
                    ),
                    TextButton(
                      onPressed: () {
                        viewModel.signOut();
                      },
                      child: Text("Sign Out"),
                    ),
                  ],
                );
        },
        viewModelBuilder: () => AuthViewModel(),
      ),
    );
  }
}
