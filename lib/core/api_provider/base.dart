import 'dart:developer';
import 'package:http/http.dart' as http;

import '../constants.dart';

class BaseApiProvider {

  static Future<http.Response> get({String? path, Map<String, dynamic>? params}) async {
    final Uri uri = Uri.parse('${Constants.baseUrl}$path');

    http.Response response = await http.get(uri);
    print('GET request');
    print('Request URL: $uri');
    print('Response code: ${response.statusCode}');
    log('Response body: ${response.body}');

    return response;
  }
}