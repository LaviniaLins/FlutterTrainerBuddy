import 'package:flutter/gestures.dart';
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
     backgroundColor: Color(0xFF41376C), 
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
      body: Stack(
  children: [
   /*
    Positioned.fill(

      child: Opacity(
        opacity: 0.5,
        child: Image.asset(
          "imagens/Buddy.png",
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    ),
*/
    
    SafeArea(
      child: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                SizedBox(width: 80, child: logoTB),
              ],
            ),
          ),

          
          Container(
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Text(
                  'Trainer \nBuddy',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = const Color.fromRGBO(68, 55, 125, 1),
                  ),
                ),
                const Text(
                  'Trainer \nBuddy',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Color(0xFFDFA921),
                  ),
                ),
              ],
            ),
          ),

          // Área do formulário
          Expanded(
  child: Stack(
    alignment: Alignment.bottomCenter,
    children: [
      //cont 1
      Container(
        margin: const EdgeInsets.only(bottom: 70),
        decoration: const BoxDecoration(
          color: Color(0xFFDFA921),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(40, 60, 40, 80), 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 25),
              campoDeTexto("Email:", Icons.email),
              const SizedBox(height: 15),
              campoDeTexto("Senha:", Icons.lock, isPassword: true),
              const SizedBox(height: 40),
              
            ],
          ),
        ),
      ),

      
      Positioned(
        bottom: 50,
        //cont 2
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF4BF3A),
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 195, vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            onPressed: () {},
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ),
      ),
    ],
  ),
),

Container(
padding: EdgeInsets.only(bottom: 40),
  child: Text("Esqueceu a senha?", style:  const TextStyle(
                                color: Colors.black,
                                
                                fontFamily: 'Poppins',),
))
        ],
      
      ),
      
      
           
              
    ),
  ],
),
    );
  }

 
  Widget campoDeTexto(String label, IconData icon, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color:const Color.fromRGBO(68, 55, 125, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            obscureText: isPassword,
            style: const TextStyle(color:Color(0xFFDFA921)),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.black),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
      ],
    );
  }
}
