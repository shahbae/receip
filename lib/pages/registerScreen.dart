// ignore: file_names
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:receipnesia/controllers/data.dart';

import 'package:receipnesia/controllers/user.dart';
import 'package:receipnesia/pages/loginScreen.dart';
import 'package:receipnesia/utils/validator_helper.dart';
import 'package:receipnesia/widgets/textfield.dart';

// ignore: camel_case_types
class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

// ignore: camel_case_types
class _registerScreenState extends State<registerScreen> {
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
  registerSubmit() async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(
            email: _emailCon.text.toString().trim(),
            password: _passCon.text,
          )
          .then((value) => Get.snackbar(
                'Succesfully',
                'User has been successfully registered.',
                snackPosition: SnackPosition.TOP,
                duration: Duration(seconds: 5),
                backgroundColor: Colors.green,
                colorText: Colors.white,
              ));
      Future.delayed(Duration(seconds: 5), () {
        Get.to(loginScreen());
      });
    } catch (e) {
      e;
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
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Sign Up ',
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
                    registerSubmit();
                  },
                  icon: const Icon(
                    color: Colors.white,
                    Icons.login,
                  ),
                  label: GestureDetector(
                    onTap: () => Get.to(
                      loginScreen(),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 120.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have an account?"),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () => Get.to(
                      loginScreen(),
                    ),
                    child: Text(
                      'Sign in',
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
