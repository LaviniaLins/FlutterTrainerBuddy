import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home/login.dart';
import 'package:home/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';




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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', _emailController.text);
      await prefs.setString('senha', _senhaController.text);
      await prefs.setString('nome', _nomeController.text);
      await prefs.setString('confirmarSenha', _confirmarSenhaController.text);
      await prefs.setBool('isLoggedIn', false);               
  
  
       Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => const Login(List: Usuario,)),
                                  );
    Usuario user1 = Usuario(_nomeController.text, _emailController.text, _senhaController.text);
    usuarios.add(user1); 
    for(var usuario in usuarios){
      print("Nome: ${usuario.nome}");
      print("Email: ${usuario.email}");
      print("Senha: ${usuario.senha}");

    }         
    }
  }

String selectedPage = "";
  Image logoTB = Image.asset("imagens/logoTB.png");

  List<Usuario> usuarios = [];


  
  @override
  
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
          fit: BoxFit.cover,
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
            child: Form( 
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
                          setState(() {
                            
                          });
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
                                    MaterialPageRoute(builder: (context) => const Login(List: Usuario)),
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
            ),),
          ),
        ],
      ),
    ),
  ],
),
    );
  }

 
  Widget campoDeTexto(String label, IconData icon, {bool isPassword = false, TextEditingController? controller, String? Function(String?)? validator}) {
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
            validator: validator,

            obscureText: isPassword,
            
            style: const TextStyle(color:Color(0xFFDFA921)),
            decoration: InputDecoration(
             
              prefixIcon: Icon(icon, color: Colors.black),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            errorStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            height: 0.9,
          ),
            
          ),
        ),
        )
        
      ],
    );
  }
  
}
