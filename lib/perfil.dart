import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home/cadastro.dart';
import 'package:home/equipe.dart';
import 'package:home/exercicios.dart';
import 'package:home/home.dart';
import 'package:home/login.dart';
import 'package:home/treinos.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  
  @override
  String selectedPage = "";
  Image logoTB = Image.asset("assets/imagens/logoTB.png");
  Widget build(BuildContext context) {
    return Scaffold(

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
  body: Stack(
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
          
Padding(padding: const EdgeInsets.all(100), 





child: CircleAvatar(
       // backgroundColor: Colors.black,
        radius: 50,
        child: Icon(Icons.person, color: Colors.black, size: 50),
      )
),



      
    ],
  ),
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