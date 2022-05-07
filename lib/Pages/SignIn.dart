import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:futurejob/Models/UserModel.dart';
import 'package:futurejob/Providers/AuthProvider.dart';
import 'package:futurejob/Providers/UserProvider.dart';

import 'package:futurejob/Widget/CustomButtom.dart';
import 'package:futurejob/Widget/TextFromFieldWidget.dart';
import 'package:futurejob/theme.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isEmailValid = true;
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProdiver>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In",
              style: titleTextStyle,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Build Your Career",
              style: subtitleTextStyle,
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                height: 240,
                width: 260,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image_sign_in.png"))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 45,
                  child: TextFormField(
                      onChanged: (value) {
                        bool isValid = EmailValidator.validate(value);
                        if (isValid) {
                          setState(() {
                            isEmailValid = true;
                          });
                        } else {
                          setState(() {
                            isEmailValid = false;
                          });
                        }
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: '',
                          fillColor: Color(0xffF1F0F5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                  color: isEmailValid
                                      ? Color(0xff4141A4)
                                      : Color(0xffFD4F56)))),
                      style: TextStyle(
                          color: isEmailValid
                              ? Color(0xff4141A4)
                              : Color(0xffFD4F56))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 45,
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      bool isValid = EmailValidator.validate(value);
                      if (isValid) {
                        setState(() {
                          isEmailValid = true;
                        });
                      } else {
                        setState(() {
                          isEmailValid = false;
                        });
                      }
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                        fillColor: Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(color: Color(0xff4141A4)))),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        title: "Sign In",
                        state: () async {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            showError("Semua Field Harus Terisi");
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            UserModel? user = await authProvider.login(
                              emailController.text,
                              passwordController.text,
                            );
                            setState(() {
                              isLoading = false;
                            });
                            if (user == null) {
                              showError('Email Atau Password Salah');
                            } else {
                              userProvider.user = user;
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/homepage', (route) => false);
                            }
                          }
                        },
                        height: 45.0,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xff4141A4),
                      ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/sign-up');
                  },
                  child: Center(
                    child: Text(
                      "Create New Account",
                      style: titleTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
