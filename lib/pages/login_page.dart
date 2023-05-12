import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          'Login Page !',
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue,
            //
          ),
        ),
      ),
    );
  }
}
