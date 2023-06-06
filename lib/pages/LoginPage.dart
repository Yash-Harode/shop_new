import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop/pages/chatgpt.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  TextEditingController loginID = TextEditingController();
  TextEditingController password = TextEditingController();

  bool checkValue() {
    String id = loginID.text.trim();
    String pass = password.text.trim();

    if (id == "" || pass == "") {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text("Alert"),
              content: const Text("Fill all fields."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
      return false;
    }
    ;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/log.jpg"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: loginID,
                        decoration:
                            const InputDecoration(labelText: "Email Address"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: password,
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: "Password"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  alignment: Alignment.topRight,
                  child: RichText(
                    text: TextSpan(
                      text: "Forgot Password?",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          print("Can't change password.");
                        }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: CupertinoButton(
                    onPressed: () {
                      if (checkValue()) {
                        login(loginID.text.toString(), password.toString());
                      }
                    },
                    color: Colors.blue,
                    child: const Text('Log In'),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "New to Logistics?",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        TextSpan(
                          text: " Register",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              print("Not developped Register Page");
                            }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
        ]),
      ),
    );
  }

  Future<void> login(String email, String password) async {
    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/register"),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print("Login Successfully");
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return HomePage();
          }),
        );
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
