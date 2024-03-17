import 'dart:convert';
import 'package:amazon_app/common/widgets/bottom_bar.dart';
import 'package:amazon_app/constants/error_handling.dart';
import 'package:amazon_app/constants/global_variables.dart';
import 'package:amazon_app/constants/utils.dart';
import 'package:amazon_app/features/home/screens/home_screen.dart';
import 'package:amazon_app/models/users.dart';
import 'package:amazon_app/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // ignore: use_build_context_synchronously
      httpErrorhandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context,
              'Account created successfully! Login with same creadentials');
        },
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }

  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint(res.body);
      // ignore: use_build_context_synchronously
      httpErrorhandling(
        response: res,
        context: context,
        onSuccess: () async {
          final SharedPreferences prfs = await SharedPreferences.getInstance();
          // ignore: use_build_context_synchronously
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prfs.setString('x-auth-token', jsonDecode(res.body)['token']);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomNavBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }

  void getUserData({
    BuildContext? context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokentResp = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      debugPrint(token);

      var response = jsonDecode(tokentResp.body);

      if (response == true) {
        http.Response userResp = await http.get(
          Uri.parse('$uri/'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );

        // ignore: use_build_context_synchronously
        var userProvider = Provider.of<UserProvider>(context!, listen: false);
        userProvider.setUser(userResp.body);
        debugPrint(userResp.body);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context!, e.toString());
    }
  }
}
