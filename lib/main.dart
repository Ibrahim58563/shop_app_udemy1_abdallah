import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_abdallah/cubit/cubit.dart';
import 'package:shop_app_abdallah/cubit/states.dart';
import 'package:shop_app_abdallah/layout/shop_app/login/shop_login_screen.dart';
import 'package:shop_app_abdallah/layout/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:shop_app_abdallah/layout/shop_app/shop_layout.dart';
import 'package:shop_app_abdallah/shared/components/constants.dart';
import 'package:shop_app_abdallah/shared/network/local/cache_helper.dart';
import 'package:shop_app_abdallah/shared/network/remote/dio_helper.dart';
import 'package:shop_app_abdallah/shared/styles/themes.dart';

void main() async {
  debugPrint("Main٠٠");
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  //bool isDark = CacheHelper.getData(key: 'isDark');
  Widget? widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');

  if (onBoarding != null && token != null) {
    if (token != null)
      widget = ShopLayout();
    else
      widget = ShopLoginScreen();
  } else {
    widget = OnBoardingScreen();
  }
  // widget = ShopLayout();
  debugPrint(onBoarding.toString());
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  MyApp({this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategories(),
        ),
      ],
      child: BlocConsumer<ShopCubit, ShopStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: lightTheme,
              home: startWidget,
            );
          }),
    );
  }
}
