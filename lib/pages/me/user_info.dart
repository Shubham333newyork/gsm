import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile',textScaleFactor: 1.5,
      
      ),
      
      titleSpacing: 9.0,
      backgroundColor: const Color.fromRGBO(220, 191, 87, 3)),
      backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('lib/assets/836.jpg'),
              ),
              const Text(
                'Unknown',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                ),
              ),
              // const Text(
              //   '',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //     letterSpacing: 2.0,
              //     fontSize: 20.0,
              //   ),

              // ),
              const SizedBox(
                height: 10.0,
                width: 200,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20,),
              Card(
                
                
                margin:const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal.shade900,
                  ),
                  title:const Text('+ 91 xxxxxxx968',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Light',
                  ),
                  
                  ),
                ),
              ),
              Card(
                
                
                margin:const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal.shade900,
                    
                  ),
                  title:const  Text('unknown@gmail.com',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Light',
                    
                  ),
                  ),
                ),

              ),
              Card(
                
                
                margin:const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.location_city,
                    color: Colors.teal.shade900,
                  ),
                  title:const Text('Durtlang North, Aizawl',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Light',
                  ),
                  
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}