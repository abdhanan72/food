import 'package:flutter/material.dart';
import 'package:food/cart/view/cart.dart';
import 'package:food/drawer/view/drawer.dart';
import 'package:food/home/view/home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();

  void setState(Null Function() param0) {}
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgets = [
    Home(),
    const Cart()
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: DrawerScreen(),
      appBar: AppBar(shadowColor: Color(0xFFF50514),
        elevation: 10,
        title: const Text('Potato'),
        
      ),
      body: _widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFF50514),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}