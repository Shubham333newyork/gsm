

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:gsm/pages/auth/sign_up_page.dart';

// import '../splash/splash.dart';

// class SignInPage extends StatelessWidget {
//   const SignInPage({super.key});

     


//   @override
//   Widget build(BuildContext context) {
//     var phoneController = TextEditingController();
//     var passwordController = TextEditingController();
    
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             SizedBox(height: 27),
//             Container(
//               child: Center(
//                 child: const CircleAvatar(
//                   backgroundColor: Color.fromARGB(255, 209, 209, 209),
//                   radius: 80,
//                   backgroundImage: AssetImage('lib/assets/flower2.png'),
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 20,),
//               width: double.maxFinite,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Hello',
//                     style: TextStyle(
//                       fontSize: 45,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),Text(
//                     'Sign into your account',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 20,),
//             Container(
//               margin: EdgeInsets.only(left: 20),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 10,
//                         spreadRadius: 7,
//                         offset: Offset(1, 10),
//                         color: Colors.grey.withOpacity(0.2))
//                   ]),
//               child: TextField(
//                 controller: phoneController,
//                 decoration: InputDecoration(
//                   hintText: 'phone',
//                   prefixIcon: Icon(
//                     Icons.phone,
//                     color: Colors.yellow,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(
//                       width: 1.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(
//                       width: 1.0,
//                       color: Color.fromARGB(255, 1, 164, 246),
//                     ),
//                   ),
//                   border:
//                       OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//                 ),
//               ),
//             ),
         
//             SizedBox(height: 20),
//             Container(
//               margin: EdgeInsets.only(left: 20),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 10,
//                         spreadRadius: 7,
//                         offset: Offset(1, 10),
//                         color: Colors.grey.withOpacity(0.2))
//                   ]),
//               child: TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   hintText: 'password',
//                   prefixIcon: Icon(
//                     Icons.password,
//                     color: Colors.yellow,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(
//                       width: 1.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(
//                       width: 1.0,
//                       color: Color.fromARGB(255, 1, 164, 246),
//                     ),
//                   ),
//                   border:
//                       OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//             Row(
//               children: [
//                 Expanded(child: Container()),
//                 RichText(
//                   text: TextSpan(
//                     text: 'Sign into your account',
//                     style: TextStyle(color: Colors.grey[500],fontSize: 20)
//                   ),
//                   ),
//                   SizedBox(width: 20,)
//               ],
//             ),
          
//          SizedBox(height: 90),
         
         
//          Container(
//             width: 196,
//             height: 80,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Color.fromARGB(168, 4, 240, 252),
//             ),
//             child: Center(
              
//               child: const Text('Sign in',textScaleFactor: 2.5, selectionColor: Colors.white,
//               ),
//           ),
//          ),
//          SizedBox(height: 20,),
         
//          RichText(
          
//            text: TextSpan(
            
//             text: 'Don\'t have an account?',
//             style: TextStyle(color: Colors.grey[500],fontSize: 20),
//             children: [
//               TextSpan(
//                 recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
//                 text: '  Create',
//               style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)
//               ),
//             ]
            
//            ),
//          ),
        
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsm/pages/auth/sign_up_page.dart';


import '../splash/splash.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  void _handleSignIn(BuildContext context) {
    // Simulate authentication
    const exampleEmail = "worldofai99@gmail.com";
    const examplePassword = "shubham@123";
    

    const enteredEmail = "worldofai99@gmail.com"; // Replace with phoneController.text
    const enteredPassword = "shubham@123"; // Replace with passwordController.text

    if (enteredEmail == exampleEmail && enteredPassword == examplePassword) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SplashScreen()));
    } else {
      print("Invalid credentials");
    }
  }

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // SizedBox(height: 27),
            const Center(
              child: Image(image: AssetImage('lib/assets/logo3.png')),
              heightFactor: 0.7,
              // child: const CircleAvatar(
              //   backgroundColor: Colors.teal,
              //   radius: 150,
              //   backgroundImage: AssetImage('lib/assets/logo3.png'),
              // ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: double.maxFinite,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sign into your account',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
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
                  hintText: 'email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 0, 135, 245),
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
                  hintText: 'password',
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Color.fromARGB(255, 1, 164, 246),
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
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                  text: const TextSpan(
                      text: 'Sign into your account',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 90),
            Container(
              width: 196,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => _handleSignIn(context),
                  child: const Text('Sign in',
                      textScaleFactor: 2.5,
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account?',
                style: const TextStyle(color: Colors.white, fontSize: 20),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const SignUpPage(),
                            transition: Transition.fade),
                      text: '  Create',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
