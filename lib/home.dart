import 'package:flutter/material.dart';
import 'package:home/cadastro.dart';
import 'package:home/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

String selectedPage = "";
  Image logoTB = Image.asset("imagens/logoTB.png");
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: const Color.fromRGBO(68, 55, 125, 1),
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

        Container(
         decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(68, 55, 125, 1),
            width: 1.0,
          )
         ), 
          child: Text("Trainer \nBuddy", style: TextStyle(color: const Color.fromRGBO(244, 191, 58, 1), fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
        ),
       SizedBox(height: 40), 
Stack(
  alignment: Alignment.center,
  children: [
    Image.asset(
  "imagens/estrela.png",
  width: 510,
  height: 510,
  fit: BoxFit.contain,
),
   
  ],
),
 Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Divider(
              color: Colors.black,
              thickness: 1,
              
            ),
             GestureDetector(
              onTap:(){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => const Login()),

                );
              },
            child: Text(
              "Entrar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),),
            const Divider(
              indent: 200,
              endIndent: 200,
              thickness: 1,
              color: Colors.white,
            ),
             GestureDetector(
              onTap:(){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => const Cadastro()),
                );
              },
            child: const Text(
              "Cadastre-se",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),),
          ],
        ),
      ),
      ],
    ),
  ),
);

  }
}