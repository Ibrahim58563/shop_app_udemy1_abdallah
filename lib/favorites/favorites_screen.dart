import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class favoritesScreen extends StatelessWidget {
  const favoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "fav Screen",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
