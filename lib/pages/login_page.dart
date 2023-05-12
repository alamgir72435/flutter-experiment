import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:google_fonts/google_fonts.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset(
          "assets/images/login.png",
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Welcome',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: 'Enter username', labelText: "Username"),
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: 'Enter password', labelText: "Password"),
        )
      ],
    ));
  }
}
