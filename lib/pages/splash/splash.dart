// import 'package:flutter/material.dart';
// import 'package:gsm/pages/home/homepage.dart'; // Import the HomePage class
// import 'package:get/get.dart'; // Import the Get package

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 10),
//     )..forward();

//     // Simulate a delay and navigate to HomePage after 2 seconds
//     Future.delayed(Duration(seconds: 2), () {
//       Get.to(() => HomePage());
//     });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _animationController,
//               builder: (context, child) {
//                 return Transform.scale(
//                   scale: _animationController.value * 2,
//                   child: child,
//                 );
//               },
//               child: Text(
//                 "Welcome to GSM BinTracker",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(height: 20),
//             LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//                 double maxWidth = constraints.maxWidth;
//                 double maxHeight = constraints.maxHeight;

//                 // Adjust these values as needed for your design
//                 double targetWidth = maxWidth * 0.8;
//                 double targetHeight = maxHeight * 0.8;

//                 return Image.asset(
//                   'lib/assets/splash.jpg',
//                   // width: 640 ,
//                   // height: 320,
//                   fit: BoxFit.fill,
                
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gsm/pages/home/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Adjust animation duration as needed
    );

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.orange[700], // Change to your desired end color
    ).animate(_controller);

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 1.2, // Change to your desired end scale
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    // Automatically navigate to the next screen after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        SchedulerBinding.instance!.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()), // Replace with your next screen
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            double maxHeight = constraints.maxHeight;

            double targetWidth = maxWidth * 1.5;
            double targetHeight = maxHeight * 2.5;

            return Stack(
              children: [
                Image.asset(
                  'lib/assets/splash6.jpg',
                  width: targetWidth,
                  height: targetHeight,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 50,
                  left: 75,
                  top: 200,
                  right: 30,
                  
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome ',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: _colorAnimation.value,
                                ),
                              ),
                              const TextSpan(
                                text: 'GSM BinTrackers',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(248, 0, 229, 245)
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
