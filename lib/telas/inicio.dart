
import 'package:flutter/material.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
import '../api.dart';
import '../custn_search_delegate.dart';
import '../model/video.dart';



class Inicio extends StatefulWidget {

  String _pesquisa;

  Inicio( this._pesquisa );

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

//método que chama a API

  _listarVideo(String pesquisa){
    Api api = Api();
    return api.pesquisar(pesquisa);
  }
  
  @override
  Widget build(BuildContext context) {
  
    return FutureBuilder<List<Video>>(
      future: _listarVideo(widget._pesquisa),
      builder: (context, snapshot){

        var exibirVideos;

        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
          return Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent.shade700, backgroundColor: Colors.black, 
            ),
          );

          case ConnectionState.active:

          case ConnectionState.done:

          if(snapshot.hasData){
            
             exibirVideos = ListView.separated(
              itemBuilder: (context, index){
                 
                 List<Video> videos = snapshot.requireData;
                 Video video = videos[index];
                  
                return GestureDetector(
                  onTap: (){
                   
                  },
                  child: Column( 
                  children: <Widget>[
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(   
                          fit: BoxFit.cover,
                          image: NetworkImage(video.imagem)
                      ),
                    ),
                   ),
                   ListTile(
                       title: Text(video.titulo),
                       subtitle: Text(video.canal +"\n"+ video.data),
                   )
                  ],
                ),
                );
              }, 
              separatorBuilder: (context, index) => Divider(
                height: 50,
                color: Colors.red
              ), 
              itemCount: snapshot.requireData.length,
              );  
          }
          else{
            Center(
              child: Text('Nenhum dado a ser exibido!'),
            );
          }
          break; 
        }
         return exibirVideos;
      } ,
      );
  }
}