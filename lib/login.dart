import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home/cadastro.dart';
import 'package:home/equipe.dart';
import 'package:home/exercicios.dart';
import 'package:home/home.dart';
import 'package:home/perfil.dart';
import 'package:home/treinos.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

final _emailController = TextEditingController();
final _senhaController = TextEditingController();

   @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }
Future<void> _fazerLogin() async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> usuarios = prefs.getStringList('usuarios') ?? [];

  bool loginSucesso = false;

  for (String usuarioJson in usuarios) {
    final Map<String, dynamic> usuario = jsonDecode(usuarioJson);
    
    if (usuario['email'] == _emailController.text &&
        usuario['senha'] == _senhaController.text) {
      loginSucesso = true;
      await prefs.setBool('isLoggedIn', true);

      
      await prefs.setString('nomeLogado', usuario['nome']);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Perfil()),
      );
      break;
    }
  }

  if (!loginSucesso) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('E-mail ou senha incorretos'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}



  
  @override





  String selectedPage = "";
  Image logoTB = Image.asset("assets/imagens/logoTB.png");
  Widget build(BuildContext context) {
   return Scaffold(
    resizeToAvoidBottomInset: false,
     backgroundColor: Color(0xFF41376C), 
     drawer: Drawer(
      child: Container(
        color: Color(0xFFDFA921), // fundo amarelo
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
             color:  const Color.fromRGBO(68, 55, 125, 1), // fundo roxo
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Seu nome',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'Poppins' )),
                          RichText(
                            text: TextSpan(
                              text: 'Perfil',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Poppins'),
                              recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Perfil()),
                                  );
                                },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // ação de assinatura
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF3A2965),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Seja assinante!', style: TextStyle(fontFamily: 'Poppins'),),
                        SizedBox(width: 8),
                        Icon(Icons.fitness_center),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildTile(Icons.home, 'Home'),
            
            _buildTile(Icons.fitness_center, 'Treinos'),
            _buildTile(Icons.sports_martial_arts, 'Exercícios'),
            _buildTile(Icons.login, 'Login'),
            _buildTile(Icons.edit, 'Cadastrar-se'),
            _buildTile(Icons.smart_toy, 'IA'),
            
           
            ListTile(
              leading: Icon(Icons.info, color: Colors.black,),
              title: Text('Nossa equipe'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tela da equipe em construção')),
                );
              },
              
            ),
          ],
        ),
      ),
    ),
      body: SingleChildScrollView(
  child: SafeArea(
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
        SizedBox(
          height: 40,
        ),
        // Área do formulário
        SizedBox(
          height: 500, // Adjust as needed
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
                    campoDeTexto("Email:", Icons.email, controller: _emailController),
                    const SizedBox(height: 15),
                    campoDeTexto("Senha:", Icons.lock, isPassword: true, controller: _senhaController),
                    const SizedBox(height: 28),
                  ],
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
                  padding: const EdgeInsets.symmetric(horizontal: 195, vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                    ),
                    onPressed: _fazerLogin,
                    child: const Text(
                      "Entrar",
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
          child: Text(
            "Esqueceu a senha?",
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    ),
  ),
),
    );
  }

 
  Widget campoDeTexto(String label, IconData icon, {bool isPassword = false,TextEditingController? controller,}) {
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
            controller: controller,
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




  
Widget _buildTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black,),
      title: Text(title),
      onTap: () {
        if (title == 'Cadastrar-se') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Cadastro()),
          );
        } else if (title == 'Login') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        }else if(title == 'Home'){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home ()),
          );}else if(title == 'Exercícios'){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const  SearchPage ()),
          );} 
         else if(title == 'Nossa Equipe'){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const  Equipe ()),
          );} 
           else if(title == 'Treinos'){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const  TreinoPage ()),
          );
          }
           else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tela de $title em construção')),
          );
        }
       print(title);
      },
    );
  }
  
}
