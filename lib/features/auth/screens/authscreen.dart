import 'package:amazon_app/common/widgets/custombutton.dart';
import 'package:amazon_app/common/widgets/customfromfield.dart';
import 'package:amazon_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signup, signin }

class AuthScreen extends StatefulWidget {
  static const String autheScreenRoute = '/authScreen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _SignUpFromKey = GlobalKey<FormState>();
  final _SignInFromKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  tileColor: _auth == Auth.signup
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  title: const Text(
                    "Create Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? value) {
                      setState(() {
                        _auth = value!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _SignUpFromKey,
                      child: Column(
                        children: [
                          CustomFormFiled(
                            hinttext: "Email",
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormFiled(
                            hinttext: "Name",
                            controller: _nameController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormFiled(
                            hinttext: "Password",
                            controller: _passwordController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            hintText: "Sign Up",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  tileColor: _auth == Auth.signin
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  title: const Text(
                    "Sign In.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? value) {
                      setState(() {
                        _auth = value!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _SignInFromKey,
                      child: Column(
                        children: [
                          CustomFormFiled(
                            hinttext: "Email",
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormFiled(
                            hinttext: "Password",
                            controller: _passwordController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            hintText: "Sign In",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
