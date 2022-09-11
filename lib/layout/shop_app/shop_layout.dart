import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_abdallah/cubit/cubit.dart';
import 'package:shop_app_abdallah/cubit/states.dart';
import 'package:shop_app_abdallah/layout/shop_app/login/shop_login_screen.dart';
import 'package:shop_app_abdallah/search/search_screen.dart';
import 'package:shop_app_abdallah/shared/components/components.dart';
import 'package:shop_app_abdallah/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: ((context, state) {}),
      builder: ((context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'salla',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, searchScreen());
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'settings'),
              ]),
        );
      }),
    );
  }
}
