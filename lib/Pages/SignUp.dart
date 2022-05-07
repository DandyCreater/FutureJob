import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:futurejob/Models/UserModel.dart';
import 'package:futurejob/Providers/AuthProvider.dart';

import 'package:futurejob/Providers/UserProvider.dart';
import 'package:futurejob/Widget/CustomButtom.dart';
import 'package:futurejob/theme.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isEmailValid = true;
  bool isUploaded = false;
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  bool isLoading = false;

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  Widget UploadImage() => Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                "assets/icon_upload.png",
                width: 120,
                height: 120,
              ),
            ],
          ),
        ),
      );

  Widget ShowedImage() => Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                "assets/image_profile.png",
                width: 120,
                height: 120,
              ),
            ],
          ),
        ),
      );

  Widget FullNameText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Full Name",
            style: titleTextStyle,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 45,
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  fillColor: Color(0xffF1F0F5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: Color(0xff4141A4)),
                  )),
            ),
          ),
        ],
      );

  Widget EmailText() => Column(
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
                controller: emailController,
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
                decoration: InputDecoration(
                  fillColor: Color(0xffF1F0F5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: isEmailValid
                              ? Color(0xff4141A4)
                              : Color(0xffFD4F56))),
                  hintText: '',
                ),
                style: TextStyle(
                    color:
                        isEmailValid ? Color(0xff4141A4) : Color(0xffFD4F56))),
          ),
        ],
      );

  Widget passwordText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              controller: passwordController,
              decoration: InputDecoration(
                  fillColor: Color(0xffF1F0F5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: Color(0xff4141A4)),
                  )),
            ),
          ),
        ],
      );

  Widget goalText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Goal",
            style: titleTextStyle,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 45,
            child: TextFormField(
              controller: goalController,
              decoration: InputDecoration(
                  fillColor: Color(0xffF1F0F5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: Color(0xff4141A4)),
                  )),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProdiver>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: titleTextStyle,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Begin New Journey",
              style: subtitleTextStyle,
            ),
            SizedBox(
              height: 50,
            ),
            isUploaded ? ShowedImage() : UploadImage(),
            SizedBox(
              height: 50,
            ),
            FullNameText(),
            SizedBox(
              height: 20,
            ),
            EmailText(),
            SizedBox(
              height: 20,
            ),
            passwordText(),
            SizedBox(
              height: 20,
            ),
            goalText(),
            SizedBox(
              height: 40,
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomButton(
                    title: "Sign Up",
                    state: () async {
                      if (nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          goalController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        showError("Semua Field Harus Terisi");
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        UserModel? user = await authProvider.register(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                            goalController.text);
                        setState(() {
                          isLoading = false;
                        });
                        if (user == null) {
                          showError('Email Sudah Terdaftar');
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
                Navigator.pushNamed(context, '/');
              },
              child: Center(
                child: Text(
                  "Back to Sign In",
                  style: titleTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
