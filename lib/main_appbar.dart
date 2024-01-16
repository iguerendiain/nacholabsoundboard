import 'package:flutter/material.dart';

class MainAppBar extends AppBar{
  MainAppBar(BuildContext context, {super.key}):super(
    title: const Text('NachoLab\'s SoundBoard'),
    // actions: <Widget>[
    //   IconButton(
    //     icon: const Icon(Icons.refresh),
    //     tooltip: "Refresh whole data",
    //     onPressed: () {
    //       ScaffoldMessenger
    //       .of(context)
    //       .showSnackBar(const SnackBar(content: Text("Refresh!!!")));
    //     }
    //   )
    // ]
  );
}