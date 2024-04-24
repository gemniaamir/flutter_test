import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:proctor/data/app_exception.dart';

import 'package:proctor/data/network/base_api_request.dart';

class NetworkAPIRequest implements BaseAPIRequest {
  @override
  Future<dynamic> getAPI(String url) async {
    dynamic decodedResponse;
    try {
      http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 20))
          .then((value) {
            decodedResponse = returnResponse(value);
          });
      
    } on SocketException {
      throw const SocketException('Internet connectivity issue');
    }

    return decodedResponse;
  }

  @override
  Future<dynamic> postAPI(var data, String url) async {
     dynamic decodedResponse;
    try {
      http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(const Duration(seconds: 20))
          .then((value) {
            decodedResponse = returnResponse(value);
          });
      
    } on SocketException {
      throw const SocketException('Internet connectivity issue');
    }

    return decodedResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw InternetException(
            exceptionMessage: 'Internet Connectivity issue');
    }
  }
}
