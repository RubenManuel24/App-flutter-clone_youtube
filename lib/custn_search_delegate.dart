import 'package:app_youtube/api.dart';
import 'package:app_youtube/model/video.dart';
import 'package:flutter/material.dart';

class CustnSearchDelegate extends SearchDelegate{
  @override

          _sugestApi(){
            Api api = Api();
            return api.pesquisar("");
          }

            List<Widget>? buildActions(BuildContext context) {
              
              return [
                    IconButton(
                      onPressed: (){
                        query = "";
                      }, 
                      icon: Icon(Icons.close))
              ];
              
            }

            @override
            Widget? buildLeading(BuildContext context) {

              return  IconButton(
                        onPressed: (){
                          close(context, "");
                            }, 
                        icon: Icon(Icons.arrow_back));
            }

            @override
            Widget buildResults(BuildContext context) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  close(context, query);
                });
              
                return Container(
                  color:  Color.fromARGB(255, 240, 151, 151) ,
                );
            }

            @override
            Widget buildSuggestions(BuildContext context) {
            //print("Sugestoes: "+query);
            
            if(query.isNotEmpty){

                return FutureBuilder<List<Video>>(
                    future: _sugestApi(),
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

                            exibirVideos = Container(
                                      
                                child: ListView.separated(
                                    itemCount: snapshot.requireData.length,
                                    itemBuilder: (context, index){

                                      List<Video> videos = snapshot.requireData;
                                      Video video = videos[index];

                                      return ListTile(
                                            onTap: (){
                                            close(context, video.titulo);
                                            },
                                              title: Text(video.titulo),
                                          );
                                  },

                                  separatorBuilder: (contex, index) => Divider(
                                    height: 15,
                                    color: Colors.black,
                                  ),

                                ),
                                
                                color: Color.fromARGB(255, 240, 151, 151),
                                
                                );
                                    
                        }
                     }

                     return exibirVideos;
                  }
                );
            }
                      
            else{
                return Container(
                    color: Color.fromARGB(255, 240, 151, 151),
                    child:  Center(
                        child: Text("SEM NENHUMA SUGESTÃO!"),
                  ),

                );
            }
       }

  }
