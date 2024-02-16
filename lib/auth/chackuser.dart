import 'package:ECommerce/auth/login_screen.dart';
import 'package:ECommerce/screen/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChackUser extends StatefulWidget {
  const ChackUser({super.key});

  @override
  State<ChackUser> createState() => _ChackUSerState();
}

class _ChackUSerState extends State<ChackUser> {
  chackUserFun() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Future.delayed(Duration.zero, () {
        Get.offAll(HomepageScreen());
      });    } else {
      Future.delayed(Duration.zero, () {
        Get.offAll(LoginScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return chackUserFun();
  }
}
