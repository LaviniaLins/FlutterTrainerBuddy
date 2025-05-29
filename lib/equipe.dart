import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home/cadastro.dart';
import 'package:home/exercicios.dart';
import 'package:home/home.dart';
import 'package:home/login.dart';
import 'package:home/perfil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home/treinos.dart';

class Equipe extends StatefulWidget {
  const Equipe({super.key});

  @override
  State<Equipe> createState() => _EquipeState();
}

class _EquipeState extends State<Equipe> {
  @override
  String selectedPage = "";
  Image logoTB = Image.asset("assets/imagens/logoTB.png");
  Image luana = Image.asset("assets/imagens/luana.jpg");
  Image lavinia = Image.asset("assets/imagens/lavinia.jpg");
  Image helena = Image.asset("assets/imagens/helena.jpg");
  Image maria = Image.asset("assets/imagens/maria.jpg");
  Image buddy = Image.asset("assets/imagens/Buddy.png");
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
                color: const Color.fromRGBO(68, 55, 125, 1), // fundo roxo
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
                            Text(
                              'Seu nome',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Perfil',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => const Perfil(),
                                          ),
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
                          Text(
                            'Seja assinante!',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
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
              _buildTile(Icons.info, 'Nossa Equipe'),
              
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder:
                            (context) => IconButton(
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
              ],
            ),
            SizedBox(height: 15),

            Container(
              child: Text(
                "Sobre",
                style: TextStyle(
                  color: const Color.fromRGBO(244, 191, 58, 1),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(height: 10),

            SizedBox(height: 35),

            CarouselSlider(
              options: CarouselOptions(
                height: 330,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 2.0,
                initialPage: 0,
              ),
              items: [
                Container(
                  child: _buildCard(
                  //icon: Icons.info,
                  title: 'Sobre',
                  content:
                      'Trainer Buddy é a solução à falta de orientação durante a execução de exercícios físicos, buscando auxiliar na correção de treinos personalizados, oferecendo suporte por uma Inteligência Artificial com o objetivo de promover saúde e condicionamento físico seguro à sociedade.',
                  ),
                ),
                Container(
                  child: _buildCard(
                 // icon: Icons.flag,
                  title: 'Missão',
                  content:
                      'Democratizar o acesso a treinos personalizados, com tecnologia que motiva e orienta, auxiliando as pessoas a praticarem exercícios de forma autônoma, correta e personalizada, para que possam evoluir sem sofrer lesões ou executar exercícios de forma errada.',
                  ),
                ),
                Container(
                  child: _buildCard(
                 // icon: Icons.visibility,
                  title: 'Problemática',
                  content:
                      'A falta de apoio de plataformas, bem como a falta de acompanhamento de um profissional de educação física ao realizar exercícios, faz com que os usuários estejam mais propensos a sofrer lesões por execuções incorretas. Isso pode minar um estilo de vida saudável por lesões.',
                ),
                ),
                Container(
                  child: _buildCard(
                 // icon: Icons.lightbulb,
                  title: 'Ferramentas',
                  content: "O sistema conta com um software desktop em C# para gerenciamento de usuários e fluxo de caixa. O site utiliza HTML, CSS, JavaScript, Bootstrap e Django, já a aplicação mobile foi desenvolvida com a linguagem Dart.",
                 
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            Divider(
              color: Color(0xFF44377D),
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(height: 40),

            Text(
              "Nossa Equipe",
              style: TextStyle(
                  color: const Color.fromRGBO(244, 191, 58, 1),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: Container(
                //margin: EdgeInsets.only(right: 300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 90, child: helena),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 230,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            color: Colors.black,
                          ),

                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "       git: HelenaPetruz \n cl203253@g.unicamp.br",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 90, child: lavinia),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 230,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            color: Colors.black,
                          ),

                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "       git: LaviniaLins \n cl203230@g.unicamp.br",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 90, child: luana),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 230,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            color: Colors.black,
                          ),

                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "       git: Luana-napoli \n cl203013@g.unicamp.br",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 90, child: maria),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 230,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            color: Colors.black,
                          ),

                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "       git: MaPeracini \n cl203218@g.unicamp.br",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
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

  Widget _buildCard({
   // required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Color(0xFFDFA921), // fundo amarelo
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            // Icon(icon, size: 40, color: Color(0xFF41376C)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
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
