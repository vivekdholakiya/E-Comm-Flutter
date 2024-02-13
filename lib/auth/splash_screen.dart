import 'package:ECommerce/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chackuser.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      Get.to( ChackUser());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.jpg"), opacity: 0.1, fit: BoxFit.fill),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.redAccent.shade100,
                Colors.redAccent.shade100,
              ]),
        ),
        child: Column(
          children: [
            Expanded(
              child:
                  Opacity(opacity: opacity.value, child: Image.asset('assets/logo.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: const TextSpan(style: TextStyle(color: Colors.black), children: [
                  TextSpan(text: 'Powered by '),
                  TextSpan(
                      text: 'vd\'s tach', style: TextStyle(fontWeight: FontWeight.bold))
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
