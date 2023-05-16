import 'package:flutter/material.dart';
import 'package:myapp/models/catelog.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/Drawer.dart';
import 'package:myapp/widgets/ItemWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
        ),
        // body: ListView.builder(
        //   itemCount: CetalogModel.items.length,
        //   itemBuilder: ((context, index) {
        //     return ItemWidget(
        //       key: index,
        //       item: CetalogModel.items[index],
        //     );
        //   }),
        // ),
        drawer: MyDrawer());
  }
}
