import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sdk/google_sdk.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Text("Current User is ${GoogleSignInPackage.getCurrentUser}"),
    );
  }
}
