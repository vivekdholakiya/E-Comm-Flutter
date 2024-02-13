import 'package:ECommerce/auth/login_screen.dart';
import 'package:ECommerce/auth/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyANXdPC3boVRE0lkmnFjjRm4r8Bf_KxiAU",
          appId: "1:267628658903:android:fa1a634cbc2c71004d7092",
          messagingSenderId: "267628658903",
          projectId: "fir-series-d4917"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
