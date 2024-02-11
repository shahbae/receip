import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<User?> user = Rx<User?>(null);

  void setUser(User? newUser) {
    user.value = newUser;
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    user.value = null;
  }
}

final UserController userController = UserController();
