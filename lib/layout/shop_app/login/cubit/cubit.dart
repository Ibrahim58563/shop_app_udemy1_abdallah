import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_abdallah/layout/shop_app/login/cubit/states.dart';
import 'package:shop_app_abdallah/layout/shop_app/login/shop_login_screen.dart';
import 'package:shop_app_abdallah/shared/network/end_points.dart';
import 'package:shop_app_abdallah/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  void userLogin({
    required String? email,
    required String? password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: Login, data: {
      'email': email,
      'passwoed': password,
    }).then((value) {
      debugPrint(value.data);
      emit(ShopLoginSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
