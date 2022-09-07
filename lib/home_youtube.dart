import 'package:app_youtube/custn_search_delegate.dart';
import 'package:app_youtube/telas/biblioteca.dart';
import 'package:app_youtube/telas/em_alta.dart';
import 'package:app_youtube/telas/incricoes.dart';
import 'package:app_youtube/telas/inicio.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _resultPesquisa = "";

  int _indiceActual = 0;
  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio( _resultPesquisa),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(
          color: Colors.black 
        ),
        backgroundColor: Colors.white,
        title: Image.asset("imagens/youtube.png",
           width: 100,
           height: 30,
        ),
        actions: <Widget>[


          /*
          IconButton(
            onPressed: (){
               print("Acção: videocam");
            }, 
            icon: Icon(Icons.videocam)),

          IconButton(
            onPressed: (){
              print("Acção: account_circle");
            }, icon: Icon(Icons.account_circle )),
          */

          IconButton(
            
            onPressed: () async {
                var result = await showSearch(context: context, delegate: CustnSearchDelegate());
                setState(() {
                   _resultPesquisa = result;
                });
                

                print("Resultado de pesquisa: "+result);
            },
            icon: Icon(Icons.search),
          ),


        ],
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: telas[_indiceActual]
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: (indice){
          setState(() {
            _indiceActual = indice;
          });
        },
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
           backgroundColor: Colors.orange,
           label: "Início",
           icon: Icon(Icons.home)
          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            label: "Em Alta",
            icon: Icon(Icons.whatshot)
          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            label : "Inscrições",
            icon: Icon(Icons.subscriptions)
          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            label: "Biblioteca",
            icon: Icon(Icons.folder)
          ),
        ],
      )
    ); 
  }
}