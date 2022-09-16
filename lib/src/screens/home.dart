import "package:flutter/material.dart";
import 'package:itour/src/screens/explore/discover.dart';
import 'package:itour/src/screens/explore/host.dart';
import 'package:itour/src/screens/explore/viewHome.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  void _select(int clicked) {
    setState(() {
      _index = clicked;
    });
  }

  final List _options = const [View(), Discover(), Host()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Itour"),
        elevation: 0,
      ),
      body: _options.elementAt(_index),
      drawer: Drawer(
        child: ListView(children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlueAccent),
              child: Text('Itour')),
          TextButton(
              onPressed: () {
                // todo:
                // add profile page
              },
              child: const Text("Profile")),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Discover()));
              },
              child: const Text("Discover")),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Host()));
              },
              child: const Text("Host")),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: 'Host'),
        ],
        selectedItemColor: Colors.blueAccent,
        onTap: _select,
      ),
    );
  }
}
