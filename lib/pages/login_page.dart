import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
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
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter username', labelText: "Username"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter password', labelText: "Password"),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Hello clicked');
                    Navigator.pushNamed(context, MyRoutes.HomeRoute);
                  },
                  child: Text('Login'),
                  style: TextButton.styleFrom(
                    minimumSize: Size(150, 40),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
