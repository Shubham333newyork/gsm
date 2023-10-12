// import 'package:flutter/material.dart';

// class CardsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Card Example')),
//       body: CardsGrid(),
//     );
//   }
// }

// class CardsGrid extends StatefulWidget {
//   @override
//   _CardsGridState createState() => _CardsGridState();
// }

// class _CardsGridState extends State<CardsGrid> {
//   bool isFirstCardFull = false;
//   bool isSecondCardFull = false;
//   bool isAuthorized = true;

//   void _toggleFirstCard() {
//     setState(() {
//       isFirstCardFull = !isFirstCardFull;
//     });
//   }

//   void _toggleSecondCard() {
//     setState(() {
//       isSecondCardFull = !isSecondCardFull;
//     });
//   }

//   void _showUnauthorizedDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Unauthorized'),
//           content: Text('You are not authorized to perform this action.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       children: [
//         Card(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.delete, color: isFirstCardFull ? Colors.red : Colors.grey),
//               SizedBox(height: 8),
//               Text(isFirstCardFull ? 'Full' : 'Empty'),
//               SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: isAuthorized ? _toggleFirstCard : () => _showUnauthorizedDialog(context),
//                 child: Text('Toggle'),
//               ),
//             ],
//           ),
//         ),
//         Card(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.delete, color: isSecondCardFull ? Colors.red : Colors.grey),
//               SizedBox(height: 8),
//               Text(isSecondCardFull ? 'Full' : 'Empty'),
//               SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: isAuthorized ? _toggleSecondCard : () => _showUnauthorizedDialog(context),
//                 child: Text('Toggle'),
//               ),
//             ],
//           ),
//         ),
//         Card(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.add, color: Colors.blue),
//               SizedBox(height: 8),
//               Text('Blank'),
//               SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: () => _showUnauthorizedDialog(context),
//                 child: Text('+'),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: CardsPage()));
// }
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dustbin Status')),
      body: const CardsGrid(),
    );
  }
}

class CardsGrid extends StatefulWidget {
  const CardsGrid({super.key});

  @override
  _CardsGridState createState() => _CardsGridState();
}

class _CardsGridState extends State<CardsGrid> {
  bool isFirstCardFull = false;
  bool isSecondCardFull = false;
  bool isAuthorized = true;

  void _toggleFirstCard() {
    setState(() {
      isFirstCardFull = !isFirstCardFull;
    });
  }

  void _toggleSecondCard() {
    setState(() {
      isSecondCardFull = !isSecondCardFull;
    });
  }

  void _showUnauthorizedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Unauthorized'),
          content: const Text('You are not authorized to perform this action.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildVaporIndicator(bool isFull) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFull ? Colors.red.withOpacity(0.5) : Colors.green.withOpacity(0.5),
      ),
      child: Icon(
        isFull ? Icons.warning : Icons.cloud_done,
        color: isFull ? Colors.red : Colors.green,
        size: 32,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(color: Colors.red, child: const Text('Dustbin 1',textScaleFactor: 1.3,)),
              _buildVaporIndicator(isFirstCardFull),
              const SizedBox(height: 8),
              Text(isFirstCardFull ? 'Full' : 'Empty'),
              const SizedBox(height: 8),
              const Text('Chanmari'),  // Location added
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: isAuthorized ? _toggleFirstCard : () => _showUnauthorizedDialog(context),
                child: const Text('Status'),
              ),
            ],
          ),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(color: Colors.black, child: const Text('Dustbin 2',textScaleFactor: 1.3,)),
              _buildVaporIndicator(isSecondCardFull),
              const SizedBox(height: 8),
              Text(isSecondCardFull ? 'Full' : 'Empty'),
              const SizedBox(height: 8),
              const Text('Durtlang'),  // Location added
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: isAuthorized ? _toggleSecondCard : () => _showUnauthorizedDialog(context),
                child: const Text('Status'),
              ),
            ],
          ),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add, color: Colors.blue),
              const SizedBox(height: 8),
              const Text('Blank'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showUnauthorizedDialog(context),
                child: const Text('+'),
              ),
            ],
          ),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ],
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
    );
  }
}

void main() {
  runApp(const MaterialApp(home: CardsPage()));
}
