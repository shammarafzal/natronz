import 'package:flutter/material.dart';
import 'package:natronz/API/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'alertDialog.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool emailValid = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/tttt.png')),
                  Text(
                    'Welcome Back !',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    'Sign in to continue to NatronZ',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Align(
                    alignment: Alignment.topLeft,
                      child: Text(
                    'Email',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                        child: Text('Login',style: TextStyle(color: Colors.white, fontSize: 18)),
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_email.text);
                          if (_email.text == "") {
                            alertScreen()
                                .showAlertDialog(context, "Please Enter Email");
                          } else if (emailValid == false) {
                            alertScreen().showAlertDialog(
                                context, "Please Enter Valid Email");
                          } else if (_password.text == "") {
                            alertScreen().showAlertDialog(
                                context, "Please Enter Password");
                          } else {
                            isLoading = true;
                            var response = await Utils().login(_email.text, _password.text);
                            print(response['status']);
                            if(response['status'] == false){
                              setState(() {
                                isLoading = false;
                              });
                              alertScreen().showAlertDialog(context, response['message']);
                            }
                            else{
                              setState(() {
                                isLoading = false;
                              });
                              prefs.setBool('isLoggedIn', true);
                              await alertScreen().showAlertDialog(context, response["message"]);
                            }
                          }
                        },
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
