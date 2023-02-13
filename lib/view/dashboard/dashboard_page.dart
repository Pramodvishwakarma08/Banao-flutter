import 'package:flutter/material.dart';

import '../../res/colors/app_color.dart';
import '../home/home_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: MyColor.grayDarkClr);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('Index 1: Learn', style: optionStyle,),
    Text('Index 2: Hub', style: optionStyle,),
    Text('Index 3: Chat', style: optionStyle,),
    Text('Index 4: Profile', style: optionStyle,),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: MyColor.grayDarkClr,
        showUnselectedLabels: true,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/bn02.png")), label: 'Learn',),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/bn03.png")), label: 'Hub',),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/bn05.png")), label: 'Chat',),
          BottomNavigationBarItem(icon: Container(child: Image.asset("assets/bn06.png"),), label: 'Profile',),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColor.blueText,
        onTap: _onItemTapped,
      ),
    );
  }
}
