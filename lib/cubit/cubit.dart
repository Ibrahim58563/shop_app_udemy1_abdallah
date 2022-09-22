import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_abdallah/categories/categories_screen.dart';
import 'package:shop_app_abdallah/models/shop_app/categories_model.dart';
import 'package:shop_app_abdallah/models/shop_app/change_favorites_model.dart';
import 'package:shop_app_abdallah/models/shop_app/home_model.dart';
import 'package:shop_app_abdallah/products/products_screen.dart';
import 'package:shop_app_abdallah/settings/settings_screen.dart';
import 'package:shop_app_abdallah/shared/components/constants.dart';
import 'package:shop_app_abdallah/shared/network/end_points.dart';
import 'package:shop_app_abdallah/shared/network/remote/dio_helper.dart';

import '../favorites/favorites_screen.dart';
import 'states.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const ProductsScreen(),
    const categoriesScreen(),
    const favoritesScreen(),
    const settingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNav());
  }

  HomeModel? homeModel;
  Map<int?, bool?> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // print(homeModel!.data!.banners[0].image!);
      // print(homeModel!.status);
      homeModel!.data!.products.forEach(
        (element) {
          favorites.addAll({
            element.id: element.inFavorites,
          });
        },
      );
      print(favorites.toString());
      emit(ShopSucessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel?.fromJson(value.data);
      emit(ShopSucessCategoriesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesDataState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;

    emit(ShopSucessChangeFavoritesState(changeFavoritesModel!));

    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);

      if (!changeFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      }

      emit(ShopChangeFavoritesState());
    }).catchError((error) {
      emit(ShopErrorChangeFavoritesState());
    });
  }
}
