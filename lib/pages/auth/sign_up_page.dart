import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gsm/base/show_custom_snackbar.dart';
import 'package:gsm/models/signup_body_model.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    // ignore: no_leading_underscores_for_local_identifiers
    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar('Type in your name', title: 'Name');
      } else if (phone.isEmpty) {
        showCustomSnackBar('Type in your number', title: 'phone number');
      } else if (email.isEmpty) {
        showCustomSnackBar('Type in your email address', title: 'email');
      } else if (GetUtils.isEmail(email)) {
        showCustomSnackBar('Type in your valid email address',
            title: 'valid email address');
      } else if (password.isEmpty) {
        showCustomSnackBar('Type in your password', title: 'password');
      } else if (password.length < 6) {
        showCustomSnackBar('password can not be less than 6 characters',
            title: 'password');
      } else {
        showCustomSnackBar('All went well', title: 'Good job');
        SignUpBody signUpBody = SignUpBody(
            name: name,
             phone: phone,
              email: email, 
              password: password
              );
              print(signUpBody.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 27),
            const Center(
              child: Image(image: AssetImage('lib/assets/logo3.png')),
              heightFactor: 0.6,
              // child: CircleAvatar(
              //   backgroundColor: Colors.teal,
              //   radius: 100,
              //   backgroundImage: AssetImage('lib/assets/logo3.png'),
              // ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 10),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'email',
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: Colors.blue,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 1, 164, 246),
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 10),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.blue,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 1, 164, 246),
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 10),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'name',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 1, 164, 246),
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 10),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'phone',
                  prefixIcon: const Icon(
                    Icons.call_end_sharp,
                    color: Colors.blue,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 1, 164, 246),
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                width: 196,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(168, 4, 240, 252),
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    textScaleFactor: 2.5,
                    selectionColor: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: 'Have an account already',
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                text: 'Sign up using google',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 5,),
            Wrap(
              children: List.generate(
                  1,
                  (index) => const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('lib/assets/google.png'),
                        backgroundColor: Colors.white,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
