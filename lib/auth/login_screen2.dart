import 'package:ECommerce/auth/forgotpass.dart';
import 'package:ECommerce/auth/otpscreen.dart';
import 'package:ECommerce/auth/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../screen/homepage.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernumbercontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  bool ispassvisible = true;
  bool isloading = false;

  phoneFun() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Phone Authentication"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(246, 237, 195, 1.00)),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    opacity: 0.1,
                    fit: BoxFit.fill,
                  ),
                  color: Color.fromRGBO(246, 237, 195, 1.00)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(flex: 3),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  const Padding(
                      padding: EdgeInsets.only(right: 56.0),
                      child: Text(
                        'Register With Phone',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )),
                  Spacer(flex: 2),
                  Container(
                    height: 300,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left: 32.0, right: 12.0),
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Form(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                key: formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: usernamecontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Name';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Name',
                                          prefixIcon: Icon(Icons.person_outlined)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null) {
                                            return "Please Enter The Mobile number";
                                          } else if (value.length < 10) {
                                            return "Please Enter a Valid Number";
                                          }
                                          return null;
                                        },
                                        decoration:
                                            InputDecoration(hintText: 'Mobile Number'),
                                        controller: usernumbercontroller,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null) {
                                            return "* Required";
                                          } else if (value.length < 6) {
                                            return "Password should be least 6 characters";
                                          }
                                          return null;
                                        },
                                        controller: userpasswordcontroller,
                                        style: TextStyle(fontSize: 16.0),
                                        obscureText: ispassvisible,
                                        decoration: InputDecoration(
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  ispassvisible = !ispassvisible;
                                                });
                                              },
                                              child: Icon(
                                                ispassvisible
                                                    ? Icons.lock_outline
                                                    : Icons.lock_open,
                                              ),
                                            ),
                                            hintText: "Password",
                                            hintStyle:
                                                TextStyle(color: Colors.grey[700])),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16, right: 8),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    InkWell(
                                        onTap: () {
                                          Get.to(ForgotPassword());
                                        },
                                        child: Text("Forgot Password")),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          child: InkWell(
                            onTap: () async {
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                verificationCompleted:
                                    (PhoneAuthCredential credantial) {},
                                verificationFailed: (FirebaseAuthException ex) {},
                                codeSent: (String varificationid, int? resendtoken) {
                                  Get.to(OtpScreen(varificationid: varificationid,));
                                },
                                codeAutoRetrievalTimeout: (verificationId) {},
                                phoneNumber:'+91'+usernumbercontroller.text.toString(),
                              );

                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.16),
                                      offset: Offset(0, 5),
                                      blurRadius: 10.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0)),
                              child: const Center(
                                child: Text(
                                  "Get Otp",
                                  style: TextStyle(
                                      color: Color(0xfffefefe),
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 2),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'You can sign in with',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.find_replace),
                              onPressed: () {},
                              color: Colors.white,
                            ),
                            IconButton(
                                icon: Icon(Icons.find_replace),
                                onPressed: () {},
                                color: Colors.white),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account ? ',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff939393),
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => {Get.to(RegisterScreen())},
                              child: const Text(
                                'Sign-up',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff748288),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
