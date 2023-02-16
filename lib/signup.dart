import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotel_booking/dashboard.dart';
import 'package:hotel_booking/main.dart';
import 'package:hotel_booking/welcome.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(Signup());
}

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Hello',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.nunitoTextTheme(
              Theme.of(context).textTheme,
            )),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(title: 'Flutter Demo Home Page'),
      ),
      designSize: const Size(360, 640),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//define colors
  bool showError = false;
  String warningText = "";
  final backgroundColor = Color(0xff191A32);
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isValidEmail(String email) {
    // Regular expression to validate email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create an account ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextField(
                  onTap: () {
                    setState(() {
                      showError = false;
                      warningText = "";
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      showError = false;
                      warningText = "";
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  controller: usernameController,
                  decoration: InputDecoration(
                    fillColor: backgroundColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                          BorderSide(color: Color(0xff33B0F6), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                          BorderSide(color: Color(0xff33B0F6), width: 2),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                          BorderSide(color: Color(0xff33B0F6), width: 2),
                    ),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  onTap: () {
                    setState(() {
                      showError = false;
                      warningText = "";
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      showError = false;
                      warningText = "";
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: backgroundColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                          BorderSide(color: Color(0xff33B0F6), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                          BorderSide(color: Color(0xff33B0F6), width: 2),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                          BorderSide(color: Color(0xff33B0F6), width: 2),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  onTap: () {
                    setState(() {
                      showError = false;
                      warningText = "";
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      showError = false;
                      warningText = "";
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: backgroundColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                          BorderSide(color: Color(0xff33B0F6), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                          BorderSide(color: Color(0xff33B0F6), width: 2),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                          BorderSide(color: Color(0xff33B0F6), width: 2),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Visibility(
                  visible: showError,
                  child: Text(
                    warningText,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff33B0F6)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 14.h),
                      ),
                    ),
                    onPressed: () {
                      var username = usernameController.text.toString();
                      var email = emailController.text.toString();
                      var password = passController.text.toString();
                      if (username.isEmpty) {
                        setState(() {
                          showError = true;
                          warningText = "Enter Username";
                        });
                      } else if (email.isEmpty) {
                        setState(() {
                          showError = true;
                          warningText = "Enter Email";
                        });
                      } else if (!isValidEmail(email)) {
                        setState(() {
                          showError = true;
                          warningText = "Enter Valid Email";
                        });
                      } else if (password.isEmpty) {
                        setState(() {
                          showError = true;
                          warningText = "Enter Password";
                        });
                      } else {
                        print('sdf');
                        var url = Uri.parse('http://10.0.2.2:3000/signup');
                        final Map<String, dynamic> requestBody = {
                          'username': username,
                          'email': email,
                          'password': password,
                        };
                        http
                            .post(
                          url,
                          body: requestBody,
                        )
                            .then((response) {
                          if (response.statusCode == 200) {
                            var data = jsonDecode(response.body);
                            if (data['message'] == 'user created') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Welcome()),
                              );
                            } else if (data['message'] ==
                                'Email is already exsit') {
                              setState(() {
                                showError = true;
                                warningText = "Email is already exsit";
                              });
                            }
                          } else {
                            print(response.statusCode);
                          }
                        }).catchError((error) {
                          print('Error:$error');
                        });
                      }
                    },
                    child: Text('Create an account'),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xff33B0F6),
                              fontSize: 15.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
