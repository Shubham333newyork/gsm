
// import 'package:flutter/material.dart';
// import 'dart:math';

// void main() {
//   runApp(const DustbinApp());
// }

// class Dustbin {
//   final int number;
//   bool isFull;
//   String location;

//   Dustbin(this.number, this.isFull, this.location);
// }

// class DustbinApp extends StatelessWidget {
//   const DustbinApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const DustbinPage(),
//     );
//   }
// }

// class DustbinPage extends StatefulWidget {
//   const DustbinPage({super.key});

//   @override
//   _DustbinPageState createState() => _DustbinPageState();
// }

// class _DustbinPageState extends State<DustbinPage> {
//   List<Dustbin> dustbins = [];
//   List<String> locationNames = [
//     'Ramhlun',
//     'Dawrpui',
//     'Chanmari',
//     'Chawlhhmun',
//     'Khatla',
//     'Chaltlang',
//     'Solomon\'s ',
//     'museum',
//     'KV Paradise',
//     ' ainawn park',
//     'zoological ',
//     'Folkland park',
//     'Paikhai',
//     // Add more location names here
//   ];
//   bool showEmpty = true;
//   bool showFull = true;
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     generateDustbins(60);
//   }

//   void generateDustbins(int count) {
//     final random = Random();
//     dustbins = List.generate(count, (index) {
//       String randomLocation = locationNames[random.nextInt(locationNames.length)];
//       return Dustbin(index + 1, random.nextBool(), randomLocation);
//     });
//   }

//   void toggleDustbinStatus(int index) {
//     setState(() {
//       dustbins[index].isFull = !dustbins[index].isFull;
//     });
//   }

//   void showUnauthorizedSnackbar(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("You aren't authorized"),
//       ),
//     );
//   }

//   void applyFilters() {
//     setState(() {});
//   }

//   List<Dustbin> getFilteredDustbins() {
//     return dustbins.where((dustbin) {
//       if (!showEmpty && !dustbin.isFull) return false;
//       if (!showFull && dustbin.isFull) return false;
//       final filter = searchController.text.toLowerCase();
//       final numberText = dustbin.number.toString().toLowerCase();
//       return numberText.contains(filter);
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Dustbin> filteredDustbins = getFilteredDustbins();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Aizawl dustbin tracker'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               onChanged: (value) {
//                 applyFilters();
//               },
//               decoration: InputDecoration(
//                 labelText: 'Search Dustbin Number',
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     searchController.clear();
//                     applyFilters();
//                   },
//                   icon: const Icon(Icons.clear),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Checkbox(
//                 value: showEmpty,
//                 onChanged: (value) {
//                   setState(() {
//                     showEmpty = value!;
//                     applyFilters();
//                   });
//                 },
//               ),
//               const Text('Empty'),
//               Checkbox(
//                 value: showFull,
//                 onChanged: (value) {
//                   setState(() {
//                     showFull = value!;
//                     applyFilters();
//                   });
//                 },
//               ),
//               const Text('Full'),
//             ],
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//               ),
//               itemCount: filteredDustbins.length,
//               itemBuilder: (context, index) {
//                 return DustbinCard(
//                   dustbin: filteredDustbins[index],
//                   onToggleStatus: () {
//                     toggleDustbinStatus(index);
//                   },
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 20),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               showUnauthorizedSnackbar(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
// class DustbinCard extends StatefulWidget {
//   final Dustbin dustbin;
//   final VoidCallback onToggleStatus;

//   DustbinCard({required this.dustbin, required this.onToggleStatus, Key? key})
//       : super(key: key);

//   @override
//   _DustbinCardState createState() => _DustbinCardState();
// }

// class _DustbinCardState extends State<DustbinCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Dustbin ${widget.dustbin.number}',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               widget.dustbin.isFull ? 'Full' : 'Empty',
//               style: TextStyle(
//                 color: widget.dustbin.isFull ? Colors.red : Colors.green,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Location: ${widget.dustbin.location}',
//               style: TextStyle(
//                 color: Colors.grey,
//               ),
//             ),
//             SizedBox(height: 8),
//             AnimatedSwitcher(
//               duration: Duration(milliseconds: 300),
//               child: widget.dustbin.isFull
//                   ? Icon(Icons.delete, color: Colors.red, key: UniqueKey())
//                   : Icon(Icons.delete_outline, color: Colors.grey, key: UniqueKey()),
//             ),
//             SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: widget.onToggleStatus,
//               child: Text(widget.dustbin.isFull ? 'Empty' : 'Fill'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:gsm/pages/me/user_info.dart';
import 'cards.dart';

void main() {
  runApp(const DustbinApp());
}

class Dustbin {
  final int number;
  bool isFull;
  String location;

  Dustbin(this.number, this.isFull, this.location);
}

class DustbinApp extends StatelessWidget {
  const DustbinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DustbinPage(),
    );
  }
}

class DustbinPage extends StatefulWidget {
  const DustbinPage({super.key});

  @override
  _DustbinPageState createState() => _DustbinPageState();
}

class _DustbinPageState extends State<DustbinPage> {
  List<Dustbin> dustbins = [];
  List<String> locationNames = [
    'Ramhlun',
    'Dawrpui',
    'Chanmari',
    'Chawlhhmun',
    'Khatla',
    'Chaltlang',
    'Solomon\'s ',
    'museum',
    'KV Paradise',
    ' ainawn park',
    'zoological ',
    'Folkland park',
    'Paikhai',
    // Add more location names here
  ];
  bool showEmpty = true;
  bool showFull = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateDustbins(60);
  }

  void generateDustbins(int count) {
    final random = Random();
    dustbins = List.generate(count, (index) {
      String randomLocation = locationNames[random.nextInt(locationNames.length)];
      return Dustbin(index + 1, random.nextBool(), randomLocation);
    });
  }

  void toggleDustbinStatus(int index) {
    setState(() {
      dustbins[index].isFull = !dustbins[index].isFull;
    });
  }

  void showUnauthorizedSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("You aren't authorized"),
      ),
    );
  }

  void applyFilters() {
    setState(() {});
  }

  List<Dustbin> getFilteredDustbins() {
    return dustbins.where((dustbin) {
      if (!showEmpty && !dustbin.isFull) return false;
      if (!showFull && dustbin.isFull) return false;
      final filter = searchController.text.toLowerCase();
      final numberText = dustbin.number.toString().toLowerCase();
      return numberText.contains(filter);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Dustbin> filteredDustbins = getFilteredDustbins();

    return Scaffold(
      
      appBar: AppBar(
        
        title: const Text('Dustbin Updates'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  'Dustbin Tracker',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            ListTile(
              leading: const Icon(Icons.arrow_forward),
              title: const Text('Add Dustbin'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CardsPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_back),
              title: const Text('Back'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                applyFilters();
              },
              decoration: InputDecoration(
                labelText: 'Search Dustbin Number',
                suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                    applyFilters();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: showEmpty,
                onChanged: (value) {
                  setState(() {
                    showEmpty = value!;
                    applyFilters();
                  });
                },
              ),
              const Text('Empty'),
              Checkbox(
                value: showFull,
                onChanged: (value) {
                  setState(() {
                    showFull = value!;
                    applyFilters();
                  });
                },
              ),
              const Text('Full'),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: filteredDustbins.length,
              itemBuilder: (context, index) {
                return DustbinCard(
                  dustbin: filteredDustbins[index],
                  onToggleStatus: () {
                    toggleDustbinStatus(index);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // IconButton(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {
          //     showUnauthorizedSnackbar(context);
          //   },
          // ),
        ],
      ),
    );
  }
}

class DustbinCard extends StatefulWidget {
  final Dustbin dustbin;
  final VoidCallback onToggleStatus;

  DustbinCard({required this.dustbin, required this.onToggleStatus, Key? key})
      : super(key: key);

  @override
  _DustbinCardState createState() => _DustbinCardState();
}

class _DustbinCardState extends State<DustbinCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dustbin ${widget.dustbin.number}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.dustbin.isFull ? 'Full' : 'Empty',
              style: TextStyle(
                color: widget.dustbin.isFull ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Location: ${widget.dustbin.location}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: widget.dustbin.isFull
                  ? Icon(Icons.delete, color: Colors.red, key: UniqueKey())
                  : Icon(Icons.delete_outline, color: Colors.grey, key: UniqueKey()),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: widget.onToggleStatus,
              child: Text(widget.dustbin.isFull ? 'Empty' : 'Fill'),
            ),
          ],
        ),
      ),
    );
  }
}
