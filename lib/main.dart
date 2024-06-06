import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_using_firebase/spashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyBF5IY9es5ZkhL271Aqzt4RjWTEpQ_FGu8',
    appId: 'com.example.login_using_firebase',
    messagingSenderId: '185796109489',
    projectId: 'fir-login-81238',
    storageBucket: 'fir-login-81238.appspot.com',
  ));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}


// firstName == "vipin" 
// lastName == "raj" 
// phNo == "1234567890"
// Email == "abc@123"
// age == "24"