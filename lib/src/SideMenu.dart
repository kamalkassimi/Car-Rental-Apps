import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_car_app/main.dart';
import 'package:flutter_car_app/src/contrat.dart';

class SideMenu extends StatelessWidget {
  final String email;

  const SideMenu({
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomePage(email: email); // Pass the email to MyHomePage
  }
}

class DrawerListTitle extends StatelessWidget {
  const DrawerListTitle({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 18,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String email; // Define email as a field in MyHomePage

  const MyHomePage({
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 76, 175, 92),
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 76, 175, 79),
              ),
              accountName: Text(
                widget.email, // Access email from widget
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text(widget.email), // Access email from widget
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(197, 137, 249, 255),
                child: Text(
                  widget.email[0],
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 175, 101, 76),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("My Course"),
          ),
          ListTile(
            leading: Icon(Icons.workspace_premium),
            title: Text("service"), onTap: () {
              serviceOption(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.video_label),
            title: Text("Saved Videos"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit Profile"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
void serviceOption(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Choisir un service'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Louer voiture'),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => MyApp()));
                  },
                ),
                ListTile(
                  title: const Text('Contrat'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Contrat()));
                  },
                ),
              ],
            ),
          );
        });
  }

