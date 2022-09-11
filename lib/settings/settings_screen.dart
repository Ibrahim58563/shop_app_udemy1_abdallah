import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "settings Screen",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
