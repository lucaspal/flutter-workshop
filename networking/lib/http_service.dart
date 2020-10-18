import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class HttpService {
  HttpService({
    @required this.baseUri,
  }) {
    this.sessionId = Uuid().v4();
  }

  final String baseUri;
  String sessionId;

  Future<bool> sendNewContent(String username, String content) async {
    final body = {
      'sessionId': sessionId,
      'username': username,
      'content': content,
    };

    final response = await http.post('$baseUri/user-details/new', body: body);

    return response.statusCode == 200;
  }

  Future<String> getHelloFromBackend({String name}) async {
    final response = await http.get('$baseUri/hello?name=$name');
    return jsonDecode(response.body)['dataString'];
  }
}
