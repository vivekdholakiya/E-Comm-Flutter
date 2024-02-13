import 'package:ECommerce/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController useremailcontroller = TextEditingController();

  forgotPassFun(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Forgot Password"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(246, 237, 195, 1.00)),
      backgroundColor: Color.fromRGBO(246, 237, 195, 1.00),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null) {
                    return "Please Enter The E-mail";
                  } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please Enter a Valid Email";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: 'Email'),
                controller: useremailcontroller,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
              child: InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    forgotPassFun(useremailcontroller.value.text.toString());
                    Get.snackbar(
                      backgroundColor: Colors.transparent,
                      "",
                      "Chack your g-mail and change your password",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(
                        seconds: 10,
                      ),
                    );
                    Get.offAll(LoginScreen());
                  } else {
                    Get.snackbar(
                      "",
                      "Something went wrong...try Again!",
                      duration: const Duration(
                        seconds: 2,
                      ),
                    );
                  }
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
                      "Forgot password",
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
    );
  }
}
