import 'package:dio/dio.dart';
import 'package:shop_app_abdallah/shared/network/local/cache_helper.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return dio!.post(url, data: data, queryParameters: query);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return dio!.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

  // delete
  static Future<Response> deleteData(
      {required url,
      Map<String, dynamic>? data,
      String? token,
      language = 'en'}) {
    String? userToken = CacheHelper.getData(key: 'userToken').toString();
    return dio!.delete(
      url,
      data: data,
      options: Options(headers: {
        'lang': language,
        'Content_Type': 'application/json',
        'Authorization': token ?? '',
      }),
    );
  }
}
