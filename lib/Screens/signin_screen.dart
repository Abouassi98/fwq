import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:graduation_project/MainWidgets/buttonSignIn.dart';
import 'package:graduation_project/MainWidgets/register_secure_text_field.dart';
import 'package:graduation_project/Screens/userHomeScreen.dart';
import 'package:flutter/cupertino.dart';

class SigninScreen extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(5, 89, 157, 1),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _form,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.blue),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'يجب عليك ادخال رقم الهاتف';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "رقم الموبايل",
                          contentPadding: EdgeInsets.only(right: 10),
                          border: (InputBorder.none),
                        ),
                      ))),
              SizedBox(
                height: 15,
              ),
              RegisterSecureTextField(
                icon: Icons.lock,
                label: "كلمة السر",
              ),
              SizedBox(height: 30),
              SignInButton(
                txtColor: Color(0xff247bb5),
                onPressSignIn: () async {
                  final isValid = _form.currentState.validate();
                  if (!isValid) {
                    return;
                  }
                  _form.currentState.save();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => UserHomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                btnWidth: 150.0,
                btnHeight: 45,
                btnColor: Color(0xffE5DDD5),
                bRadius: BorderRadius.circular(50.0),
                btnShadow: [
                  BoxShadow(
                      color: Colors.black26, spreadRadius: 1, blurRadius: 5)
                ],
                buttonText: 'تسجيل الدخول',
                textSize: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(' نسيت كلمة السر ؟ ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0)),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (_) => ForgetPassword()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
