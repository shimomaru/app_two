import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good Afternoon'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        fixedColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.cottage_outlined,
              color: Colors.pink,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Buy',
            icon: Icon(
              Icons.fastfood_outlined,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.account_circle,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Pick up',
            icon: Icon(
              Icons.local_taxi,
              color: Colors.yellow,
            ),
          ),
        ],
        onTap: (int itemIndex) {
          setState(() {
            _selectedIndex = itemIndex;
          });
        },
      ),
      body: Center(
        child: Image.asset('assets/genji.png'),
      ),
    );
  }
}
