import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/Drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
        ),
        body: Center(
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
        drawer: MyDrawer());
  }
}
