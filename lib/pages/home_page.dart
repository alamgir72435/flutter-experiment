import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Alamgir ";
    double pi = 3.14;
    bool isMale = false;
    num temp = 30.5;

    var day = "TeusDay";
    const execVal = 3.4;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.LoginRoute);
                },
                child: Text('Go to Login'),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Text('This is Drawer'),
      ),
    );
  }
}
