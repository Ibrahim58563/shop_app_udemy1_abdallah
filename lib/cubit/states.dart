// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shop_app_abdallah/models/shop_app/change_favorites_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNav extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSucessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopSucessCategoriesDataState extends ShopStates {}

class ShopErrorCategoriesDataState extends ShopStates {}

class ShopChangeFavoritesState extends ShopStates {}

class ShopSucessChangeFavoritesState extends ShopStates {
  final ChangeFavoritesModel model;
  ShopSucessChangeFavoritesState(
    this.model,
  );
}

class ShopErrorChangeFavoritesState extends ShopStates {}
