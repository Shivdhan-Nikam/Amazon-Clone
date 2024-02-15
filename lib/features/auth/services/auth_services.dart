import 'package:amazon_app/constants/error_handling.dart';
import 'package:amazon_app/constants/global_variables.dart';
import 'package:amazon_app/constants/utils.dart';
import 'package:amazon_app/models/users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  void signUp(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: '',
          email: email,
          name: name,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorhandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context,
              'Account created successfully! Login with same creadentials');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
