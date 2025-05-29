import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home/equipe.dart';
import 'package:home/exercicios.dart';
import 'package:home/home.dart';
import 'package:home/login.dart';
import 'package:home/perfil.dart';
import 'package:home/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';




class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _confirmarSenhaController = TextEditingController();
  final _nomeController = TextEditingController();

 
void _cadastrar() async {
  if (_formKey.currentState!.validate()) {
    final prefs = await SharedPreferences.getInstance();

    
    final List<String> usuarios = prefs.getStringList('usuarios') ?? [];

   
    final novoUsuario = jsonEncode({
      
      'email': _emailController.text,
      'senha': _senhaController.text,
      'nome': _nomeController.text,
    });

    
    usuarios.add(novoUsuario);
    await prefs.setStringList('usuarios', usuarios);

    //console
    for (var user in usuarios) {
      final dados = jsonDecode(user) as Map<String, dynamic>;
      print('----');
     print('Email: ${dados['email']}');
      print('Senha: ${dados['senha']}');
    }

    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
}

String selectedPage = "";
  Image logoTB = Image.asset("assets/imagens/logoTB.png");

  List<Usuario> usuarios = [];


  
  @override
  
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
              height: 180,
             color:  const Color.fromRGBO(68, 55, 125, 1), // fundo roxo
              padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
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
                              style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins'),
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
        // Área do formulário
        Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(top: 85),
            decoration: const BoxDecoration(
              color: Color(0xFFDFA921),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  campoDeTexto("Nome:", Icons.person, controller: _nomeController, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome.';
                    }
                    return null;
                  }),
                  const SizedBox(height: 15),
                  campoDeTexto("Email:", Icons.email, controller: _emailController, validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email.';
                    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                      return "email inválido";
                    }
                    return null;
                  }),
                  const SizedBox(height: 15),
                  campoDeTexto("Senha:", Icons.lock, isPassword: true, controller: _senhaController, validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha.';
                    } 
                    return null;
                  }),
                  const SizedBox(height: 15),
                  campoDeTexto("Confirme sua senha:", Icons.lock, isPassword: true, controller: _confirmarSenhaController, validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Por favor, confirme sua senha.';
                    } else if (value != _senhaController.text) {
                      return 'As senhas não coincidem.';
                    }
                    return null;
                  }),
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
                        final form = _formKey.currentState;
                        print("Nome: ${_nomeController.text}");
                        print("Email: ${_emailController.text}");
                        print("Senha: ${_senhaController.text}");
                        print("Confirmar: ${_confirmarSenhaController.text}");
                        if(form != null && form.validate()){
                          _cadastrar();
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Preencha todos os campos corretamente!"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                        setState(() {});
                      },
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.black, fontSize: 18),
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Login()),
                                );
                              },
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
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
           
           else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tela de $title em construção')),
          );
        }
       print(title);
      },
    );
  }


 
 Widget campoDeTexto(
  String label,
  IconData icon, {
  bool isPassword = false,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) {
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

      
      TextFormField(
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (_) => setState(() {}),
        obscureText: isPassword,
        style: const TextStyle(color: Color(0xFFDFA921)),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),

          
          filled: true,
          fillColor: const Color.fromRGBO(68, 55, 125, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),

          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          errorStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ),

      
      const SizedBox(height: 8),
    ],
  );
}

  
}
