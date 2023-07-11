import 'package:dio/dio.dart';

class DioHelper{
  //GET https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=b9bcfaa921714224b8655b262cf5837c

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Dio? dio;

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  })async{
    return await dio!.get(
        url,
        queryParameters: query,
    );
  }
}