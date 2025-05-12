import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  String selectedPage = "";
  Image logoTB = Image.asset("imagens/logoTB.png");
  Widget build(BuildContext context) {
    return Scaffold();
    backgroundColor: const Color.fromRGBO(68, 55, 125, 1);
  }
}