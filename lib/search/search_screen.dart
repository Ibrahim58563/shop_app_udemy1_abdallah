import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "search Screen",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
