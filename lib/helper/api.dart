import 'dart:developer';

import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();
  static String baseUrl = "https://fakestoreapi.com";

  Future<List<dynamic>> get({required String urlPath, String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }

    List<dynamic> data = [];
    try {
      Response response = await dio.get(
        "$baseUrl/$urlPath",
        options: Options(headers: headers), 
      );
      data = response.data as List;
    } catch (e) {
      log('Error during GET request: $e'); 
      rethrow; 
    }
    return data;
  }

  Future<dynamic> post(
      {required String urlPath,
      required Map<String, dynamic> data,
      String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }

    dynamic response;
    try {
      Response res = await dio.post(
        "$baseUrl/$urlPath",
        data: data,
        options: Options(headers: headers),
      );
      response = res.data;
    } catch (e) {
      log('Error during POST request: $e'); 
      rethrow; 
    }
    return response;
  }

  Future<dynamic> put(
      {required String urlPath,
      required Map<String, dynamic> data,
      String? token}) async {
    Map<String, dynamic> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };

    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }

    dynamic response;
    try {
      Response res = await dio.put(
        "$baseUrl/$urlPath",
        data: data,
        options: Options(headers: headers),
      );
      response = res.data;
    } catch (e) {
      log('Error during PUT request: $e'); 
      rethrow;

    }

    return response;
  }
}
