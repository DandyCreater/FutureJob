import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:futurejob/theme.dart';

class TextFromFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool Obsecure;

  TextFromFieldWidget({
    required this.controller,
    required this.title,
    required this.Obsecure,
  });

  @override
  _TextFromFieldWidgetState createState() => _TextFromFieldWidgetState();
}

class _TextFromFieldWidgetState extends State<TextFromFieldWidget> {
  @override
  Widget build(BuildContext context) {
    bool isEmailValid = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: titleTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 45,
          child: TextFormField(
            obscureText: widget.Obsecure ? true : false,
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
            controller: widget.controller,
            decoration: InputDecoration(
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
                            : Color(0xffD4F56)))),
          ),
        ),
      ],
    );
  }
}
