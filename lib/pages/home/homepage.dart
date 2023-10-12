import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsm/pages/AboutUs/info.dart';
import 'package:gsm/pages/DustbinMap/map.dart';
import 'package:gsm/pages/account/account_page.dart';
import 'package:gsm/pages/auth/sign_up_page.dart';
import 'package:gsm/pages/dustbin/dustbin.dart';
import 'package:gsm/pages/me/user_info.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  List pages = [
    
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }
  List<Widget> _buildScreens() {
        return [
           // ignore: prefer_const_constructors
           MapPage(),
    //       Container(
    //   child: Center(
    //     child: Text("Next Page1"),
    //   ),
    // ),
    const DustbinApp(),
    // Container(
    //   child: Center(
    //     child: Text("Next Page2"),
    //   ),
    // ),

    
    // Container(
    //   child: Center(
    //     child: Text("Next Page3"),
    //   ),
    // ),
    InfoScreen(),
    // Container(
    //   child: const Center(
    //     child: Text("Next Page4"),
    //   ),
    // ),
         const UserInfo(), 
        ];
    }
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.location_circle_fill),
                title: ("Maps"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.black,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.trash_fill),
                title: ("dustbin"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.black,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.info),
                title: ("About Us"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.black,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.person),
                title: ("Me"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: const Color.fromARGB(255, 8, 8, 8),
            ),
        ];
    }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[_selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //         selectedItemColor: Color.fromARGB(255, 20, 13, 13),
  //         unselectedItemColor: Colors.black,
  //         onTap: onTapNav,
  //         currentIndex: _selectedIndex,
  //         items: const [
  //           BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.home,
  //               color: Color.fromARGB(255, 10, 0, 0),
  //             ),
  //             label: 'Home',
  //             backgroundColor: Colors.black12,
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.recycling_outlined,
  //               color: Color.fromARGB(255, 12, 255, 85),
  //             ),
  //             label: 'Dust',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.info,
  //               color: Color.fromARGB(255, 255, 1, 1),
  //             ),
  //             label: 'Message',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.person,
  //               color: Color.fromARGB(255, 5, 0, 0),
  //             ),
  //             label: 'signIn',
  //           ),
  //         ]),
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
