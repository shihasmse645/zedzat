import 'package:flutter/material.dart';
import 'package:zedzat/screens/profile.dart';
import 'package:zedzat/screens/rewards.dart';

import 'cart.dart';
import 'homescreen.dart';
import 'offers.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages =  [
    {'Page':const HomeScreen(),'title':'Home Screen'},
    {'Page':const OfferScreen(),'title':'Offers'},
    {'Page':const Rewards(),'title':'Rewards'},
    {'Page':const CartScreen(),'title':'Cart'},
    {'Page':const Profile(),'title':'Profile'},

    ];

  void _selectedpage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title:Text( _pages[_selectedIndex]['title'],style: TextStyle(color: Colors.black),),
      //     backgroundColor: Colors.white,
      // ),
      body: _pages[_selectedIndex]['Page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectedIndex,
        onTap: _selectedpage,
        items: <BottomNavigationBarItem> [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.local_offer),label: "Categories"),
                BottomNavigationBarItem(icon: Icon(Icons.card_giftcard),label: "Rewards"),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "Cart"),
                BottomNavigationBarItem(icon: Icon(Icons.person_2),label: "Profile"),

                
        ]
        ),
    );
  }
}