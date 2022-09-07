import 'package:flutter/material.dart';
class Biblioteca extends StatefulWidget {
  Biblioteca({Key? key}) : super(key: key);

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Biblioteca",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
      ),
      )
      
    );
  }
}