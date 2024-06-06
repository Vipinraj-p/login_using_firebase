import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_using_firebase/WelcomePg.dart';
import 'package:login_using_firebase/signUpPage.dart';

class LoginPg extends StatefulWidget {
  const LoginPg({super.key});

  @override
  State<LoginPg> createState() => _LoginPgState();
}

class _LoginPgState extends State<LoginPg> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.login_rounded,
          size: 30,
          color: Colors.blueGrey,
        ),
        title: Text(" Login Page"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(children: [
              Icon(
                Icons.sports_martial_arts_outlined,
                color: Colors.white60,
                size: 180,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: "Email"),
                //=====================================controller: ,
                controller: emailController,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    labelText: "Password"),
                //=====================================controller: ,
                controller: passwordController,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then(
                        (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Welcome(),
                              ));
                        },
                      ).onError(
                        (error, stackTrace) {
                          print('Error : ${error.toString()}');
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                    'Wrong input\nError:${error.toString()}'),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text("Sign in",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 12, 12, 165),
                        fixedSize: Size(180, 50)),
                  ),
                  SizedBox(width: 23),
                  ElevatedButton(
                    onPressed: () {
                      emailController.clear();
                      passwordController.clear();
                    },
                    child: Text(
                      "Clear",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(195, 76, 78, 175),
                        foregroundColor: Colors.white,
                        fixedSize: Size(180, 50)),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signUp(),
                            ));
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
