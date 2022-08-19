import 'package:flutter_getx_mvvm_sample/src/model/random_user.dart';
import 'package:flutter_getx_mvvm_sample/src/model/random_user_simple.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RandomUserRepository {
  static final RandomUserRepository _instance =
      RandomUserRepository._internal();
  factory RandomUserRepository() {
    return _instance;
  }
  RandomUserRepository._internal();

  Future<List<RandomUser>> getAllUser() async {
    try {
      var url = Uri.https('randomuser.me', 'api', {'results': '100'});

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        return jsonResponse['results']
            .map<RandomUser>((data) => RandomUser.fromJson(data))
            .toList();
      }
    } catch (e, stack) {
      print(stack);
      return [];
    }
    return [];
  }

  Future<List<RandomUserSimple>> getAllUserWithSimple() async {
    try {
      var url = Uri.https('randomuser.me', 'api', {'results': '100'});

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        return jsonResponse['results']
            .map<RandomUserSimple>((data) => RandomUserSimple.fromJson(data))
            .toList();
      }
    } catch (e, stack) {
      print(stack);
      return [];
    }
    return [];
  }
}
