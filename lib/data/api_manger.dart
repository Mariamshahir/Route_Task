import 'package:dio/dio.dart';

class ApiManager {
  static const String baseUrl = "https://dummyjson.com/";
  late Dio dio;

  ApiManager() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20));
    dio = Dio(options);
  }

  Future<List<dynamic>> loadingProducts() async {
    try {
      Response response = await dio.get("products");
      print(response.data.toString());
      return response.data['products'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
