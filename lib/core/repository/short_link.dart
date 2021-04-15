import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../api_provider/base.dart';
import '../constants.dart';
import '../model/short_link.dart';

class ShortLinkRepository {

  static Future<ShortLink> create(String link) async {
    String path = '${Constants.shortenPath}?url=$link';
    http.Response response = await BaseApiProvider.get(path: path);
    if (response.statusCode == 201) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return ShortLink.fromJson(responseBody['result']);
    } else {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      int code = responseBody['error_code'];
      throw PlatformException(
        code: 'short_link_create_error',
        message: ShortLink.errorCodeToMessage(code),
      );
    }
  }

}