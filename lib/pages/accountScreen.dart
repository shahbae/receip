import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:receipnesia/pages/loginScreen.dart';
import 'package:receipnesia/controllers/user.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account"),
        actions: [
          IconButton(
            onPressed: () => {
              userController.logout(),
              Get.to(loginScreen()),
            },
            icon: Icon(
              Icons.logout_rounded,
            ),
          )
        ],
      ),
      body: Center(
        child: Obx(
          () {
            User? user = userController.user.value;
            return user != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle_rounded,
                        size: 180,
                        color: const Color(0xFF66757F),
                      ),
                      Text(
                        "${user.email}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("not found"),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
