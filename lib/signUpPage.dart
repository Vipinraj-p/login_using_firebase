import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_using_firebase/WelcomePg.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.edit_note_rounded,
          size: 30,
          color: Colors.blueGrey,
        ),
        title: Text(" Sign Up Page"),
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
                    prefixIcon: Icon(Icons.person),
                    labelText: "User Name"),
                //=====================================controller: ,
                controller: userNameController,
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
                    labelText: "email"),
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
                      print("ElevatedButt :${userNameController.text}");
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then(
                        (value) {
                          print('Created new account');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Welcome(),
                              ));
                        },
                      ).onError(
                        (error, stackTrace) {
                          print("error : ${error.toString()}");
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
                    child: Text("Sign Up",
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
                      userNameController.clear();
                      passwordController.clear();
                      emailController.clear();
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
            ]),
          ),
        ),
      ),
    );
  }
}
