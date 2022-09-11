import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class categoriesScreen extends StatelessWidget {
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Categories Screen",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
