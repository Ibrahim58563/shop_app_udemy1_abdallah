import 'package:shop_app_abdallah/shared/components/components.dart';
import 'package:shop_app_abdallah/shared/network/local/cache_helper.dart';

import '../../layout/shop_app/login/shop_login_screen.dart';

void signOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigateAndFinish(
        context,
        ShopLoginScreen(),
      );
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) {
    print(element.group(0));
  });
}

String token = '';
