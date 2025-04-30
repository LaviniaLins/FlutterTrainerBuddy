import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home/login.dart';




class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {


  
  @override
  String selectedPage = "";
  Image logoTB = Image.asset("imagens/logoTB.png");
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: const Color.fromRGBO(68, 55, 125, 1), 
      body: SafeArea(
        child: Column(
          children: [
            
            Stack(

              children: <Widget>[
                Opacity(opacity: 0.5,
                
                 child: Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 20),
              
              child: Image.asset(
                "imagens/Buddy.png",
                width: MediaQuery.of(context).size.width * 0.8, 
                fit: BoxFit.contain,
              ),
            ),),

           Container
           (
           padding: const EdgeInsets.only(top: 200.0),
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
    Text(
      'Trainer \nBuddy',
      style: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: const Color.fromRGBO(244, 191, 58, 1), 
      ),
    ),
  ],
)
 ),
            Container( 
              padding: const EdgeInsets.only(top:455),
              alignment: Alignment.center,
            child: Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4BF3A), 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      campoDeTexto("Nome:", Icons.person),
                      const SizedBox(height: 15),
                      campoDeTexto("Email:", Icons.email),
                      const SizedBox(height: 15),
                      campoDeTexto("Senha:", Icons.lock, isPassword: true),
                      const SizedBox(height: 15),
                      campoDeTexto("Confirme sua senha:", Icons.lock, isPassword: true),
                      const SizedBox(height: 30),

                      
                      Center(
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
                          onPressed: () {
                            
                          },
                          child: const Text(
                            "Cadastrar",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Já tem uma conta? ",
                            style: const TextStyle(color: Colors.black),
                            
                            children: [
                              TextSpan(
                                text: "Entre aqui",
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => const Login()),

                );
                                },
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            )
              ],

            ),
           

            
            
            
          ],
        ),
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
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.white),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
      ],
    );
  }
}


/*
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {


  
  @override
  String selectedPage = "";
  Image logoTB = Image.asset("imagens/logoTB.png");
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: const Color(0xFF3D2A84), // Roxo de fundo
      body: SafeArea(
        child: Column(
          children: [
            // Buddy centralizado no topo
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "imagens/Buddy.png",
                width: MediaQuery.of(context).size.width * 0.5, // 50% da largura
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 10),

            // Título "Trainer Buddy"
            Text(
              "Trainer\nBuddy",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF4BF3A),
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),

            const SizedBox(height: 20),

            // Formulário
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4BF3A), // Amarelo do formulário
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      campoDeTexto("Nome", Icons.person),
                      const SizedBox(height: 15),
                      campoDeTexto("Email", Icons.email),
                      const SizedBox(height: 15),
                      campoDeTexto("Senha", Icons.lock, isPassword: true),
                      const SizedBox(height: 15),
                      campoDeTexto("Confirme sua senha", Icons.lock, isPassword: true),
                      const SizedBox(height: 30),

                      // Botão cadastrar
                      Center(
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
                          onPressed: () {
                            // ação de cadastrar
                          },
                          child: const Text(
                            "Cadastrar",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Link para login
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Já tem uma conta? ",
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Entre aqui",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para criar campos de texto
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
            color: Color(0xFF3D2A84),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            obscureText: isPassword,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.white),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
      ],
    );
  }
}

   
   */