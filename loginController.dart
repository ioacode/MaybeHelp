import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_helloworld/controller/menu.dart';
import 'package:test_helloworld/model/datamodel.dart';
import 'package:test_helloworld/setting/services/ApiService.dart';
import 'package:test_helloworld/setting/services/ApiSession.dart';

class loginController extends StatefulWidget {
  @override
  _loginControllerState createState() => _loginControllerState();
}

class _loginControllerState extends State<loginController> {
  ApiSession apiSession = ApiSession();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  Widget _entryFieldEmail(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (val) =>
                !val.contains('@') ? 'Not a valid Email.' : null,
            onSaved: (val) => _email = val,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _entryFieldPassword(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            validator: (val) => val.length < 6 ? 'Password too Short.' : null,
            onSaved: (val) => _password = val,
            obscureText: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return InkWell(
      onTap: () {
        _login();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.greenAccent, Colors.green])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void _login() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
    }
    var requestLogin = {"email": _email, "password": _password};
    var api = ApiService.login(requestLogin);
    api.then((response) {
      final Map parsed = json.decode(response);
      userlogin login = userlogin();
      login.Username = parsed['data']['Username'];
      login.email = parsed['data']['email'];
      apiSession.save('login', login);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
      print("success");
    }, onError: (error) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse('FFedf4fc', radix: 16)),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: MediaQuery.of(context).size.height - 200,
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(height: 24.0, child: labelTitle()),
                            Container(
                                child: Form(
                              key: formKey,
                              child: Column(children: [
                                SizedBox(height: 24),
                                _entryFieldEmail(context, "Email"),
                                _entryFieldPassword(context, "Password"),
                                SizedBox(height: 24),
                                _submitButton(context),
                                _forgetPassword()
                              ]),
                            ))
                          ],
                        ))),
                  ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 80,
                child: Center(
                  child: labelRegister(),
                )),
          )
        ],
      )),
    );
  }
}

Widget labelRegister() {
  return InkWell(
    onTap: () {
      print("register");
    },
    child: Text(
      "Dont have Account, Please Register.",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
  );
}

Widget labelTitle() {
  return Text(
    "First Flutter",
    style: TextStyle(
      fontFamily: "AvenirBold",
      fontSize: 24,
    ),
  );
}

Widget _forgetPassword() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.centerRight,
    child: InkWell(
      onTap: () {
        print("forget Password");
      },
      child: Text(
        "Forgot Password ?",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
