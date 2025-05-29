import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home/cadastro.dart';
import 'package:home/classexercicios.dart';
import 'package:home/equipe.dart';
import 'package:home/home.dart';
import 'package:home/login.dart';
import 'package:home/perfil.dart';
import 'package:home/treinos.dart';




class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController _searchController = SearchController();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _nomecontroller = TextEditingController();
  final List<String> exercicios = [
    'Flexão',
    'Tríceps',
    'Abdominal',
      
    
  ];

  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      _opacity = 1.0 - (_scrollController.offset / 200).clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _showAddExerciseDialog(String exercise) {
    int sets = 3;
    int reps = 15;

    showDialog(
      
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xFFF4BF3A),
              
              title:Padding(padding: EdgeInsets.only(left: 80),
              
              child: Text(" $exercise", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),)
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.start,

                     children: [
                   Text("Séries:", style: TextStyle(fontSize: 16)),
                  
                    
                   SizedBox(width: 85,),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (sets > 1) {
                            setState(() => sets--);
                          }
                        },
                      ),
                      Text("$sets", style: const TextStyle(fontSize: 18)),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          if (sets < 10) {
                            setState(() => sets++);
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  const Text("Repetições:", style: TextStyle(fontSize: 16)),
                  
                    SizedBox(width: 50,),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (reps > 1) {
                            setState(() => reps--);
                          }
                        },
                      ),
                      Text("$reps", style: const TextStyle(fontSize: 18)),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          if (reps < 20) {
                            setState(() => reps++);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar", style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF3A2965)),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3A2965),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    print("Exercício: $exercise | Séries: $sets | Reps: $reps");
                    Navigator.pop(context);
                  },
                  child: const Text("Adicionar", style: TextStyle(fontFamily: 'Poppins', color: Colors.white),),
                ),
              ],
            );
          },
        );
      },
    );
  }


String nomeTreino = "Seu Treino";
List<Exercicios> treino = [];

void adiconaExercico(String nome, String series, String reps) {
    setState(() {
      treino.add(Exercicios(nome: nome, series: series, reps: reps));
    });

}

  @override
  String selectedPage = "";
  Image logoTB = Image.asset("assets/imagens/logoTB.png");
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF41376C) ,
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
            _buildTile(Icons.info, 'Nossa Equipe'),
           
            
          ],
        ),
      ),
    ),
      body: SingleChildScrollView(
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

            //barra de pesquisa começando aqui
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(
              backgroundColor: MaterialStateProperty.all<Color>((Color(0xFFF4BF3A)
)),
                controller: _searchController,
                hintText: 'Pesquisar',
                leading: const Icon(Icons.search),
                onChanged: (query) => setState(() {}),
              ),
            ),//acaba

            //exercicios e array
            ListView.builder(
              shrinkWrap: true,
              
              physics: NeverScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: exercicios.length,
              itemBuilder: (context, index) {
                final exercise = exercicios[index];
                if (_searchController.text.isNotEmpty &&
                    !exercise.toLowerCase().contains(
                          _searchController.text.toLowerCase(),
                        )) {
                  return const SizedBox.shrink();
                }
                return Opacity(
                  opacity: _opacity,
                  child: Card(
                    color: Color(0xFFDFA921),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: ListTile(
                      title: Text(exercise),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => _showAddExerciseDialog(exercise),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFDFA921),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 7),
                child: Text("Seu Treino", style: TextStyle(fontSize: 25),),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF44377D),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 480,
                width: 400,
                child: Padding(padding: EdgeInsets.only(top: 200),
                  child: Text(
                  "Adicione aqui seus exercícios",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Poppins', decoration: TextDecoration.underline, decorationColor: Colors.white ),
                ),),
              ),
            )
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
}