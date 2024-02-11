import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:receipnesia/controllers/data.dart';
import 'package:receipnesia/controllers/user.dart';
import 'package:receipnesia/pages/homeScreen.dart';
import 'package:receipnesia/pages/registerScreen.dart';
import 'package:receipnesia/utils/validator_helper.dart';
import 'package:receipnesia/widgets/textfield.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

// ignore: camel_case_types
class _loginScreenState extends State<loginScreen> {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();

  final DataController dataController = Get.put(DataController());
  @override
  void initState() {
    super.initState();
    dataController.fetchData();
  }

  //
  final UserController userController = Get.put(UserController());
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginSubmit() async {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(
        email: _emailCon.text,
        password: _passCon.text,
      )
          .then((UserCredential userCredential) {
        User? user = userCredential.user;
        userController.setUser(user);
        print("Login successful. User UID: ${user?.uid}");
        Get.offAll(
          () => const HomeScreen(),
        );
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/logo.png',
                fit: BoxFit.fill,
                width: 300,
              ),
              SizedBox(
                height: 24,
              ),
              const Text(
                'Sign in using your account',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 68.0),
              SDTextfield(
                hintText: "Email",
                kontroler: _emailCon,
                secure: false,
                label: "Enter your email",
                validator: (value) => Validator.required(
                  value,
                ),
              ),
              const SizedBox(height: 10.0),
              SDTextfield(
                hintText: "Password",
                kontroler: _passCon,
                secure: true,
                label: "Enter your password",
                validator: (value) => Validator.required(
                  value,
                ),
              ),
              const SizedBox(height: 5.0),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 28.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 58,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF66757F),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    loginSubmit();
                  },
                  icon: const Icon(
                    color: Colors.white,
                    Icons.login,
                  ),
                  label: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () => Get.to(
                      registerScreen(),
                    ),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFF66757F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
