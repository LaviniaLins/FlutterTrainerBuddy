import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  
  @override
  String selectedPage = "";
  Image logoTB = Image.asset("imagens/logoTB.png");
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: const Color.fromRGBO(65, 55, 108, 1),
    drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Drawer Header', style: TextStyle(color: Color.fromARGB(244, 191, 58, 1), fontSize: 24)),
        ),
        ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Messages'),
          onTap: () {
            setState(() {
              selectedPage = 'Messages';
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Profile'),
          onTap: () {
            setState(() {
              selectedPage = 'Profile';
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            setState(() {
              selectedPage = 'Settings';
            });
          },
        ),
      ],
    ),
  ),
  body: SafeArea(
    child: Column(
      children: [
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder( 
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              SizedBox(
                width: 80,
                child: logoTB, 
              ),
            ],
          ),
        ),
      ],
),
  ),
   );

  }
}