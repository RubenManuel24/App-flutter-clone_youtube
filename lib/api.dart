import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/video.dart';
    

const CHAVE_ID = 'AIzaSyDF00uOv7lym5Lkr_tdgT24q7A5nP23u5I';
const ID_CANAL = "UCFuIUoyHB12qpYa8Jpxoxow";
const URL_BASE = "www.googleapis.com";

class Api {
 Future <List<Video>> pesquisar(String pesquisa) async{
    var caminho = "/youtube/v3/search";

    var paramentro = {
            'part':'snippet',
            'type':'video',
             'maxResults':'10',
             'order':'date',
             'key':"$CHAVE_ID",
             'channelId':'$ID_CANAL',
             'q':'$pesquisa',
    };
      
      var urlApi = Uri.https(URL_BASE, caminho, paramentro);

      http.Response response = await http.get(urlApi);

      if(response.statusCode == 200){
        //print("Resultado: "+response.body);
        Map<String, dynamic> dadosJson = json.decode(response.body);

        List<Video> listVideos = dadosJson['items'].map<Video>(
          (map){
            return Video.fromJson(map);
            //return Video.convertJson(map);
          }
        ).toList();    
        
        return listVideos;
            
      /*for(var video in dadosJson["items"]){    
        print("Resultado: "+video.toString());
      }*/

      //print("Resultado: "+dadosJson["items"][2]["snippet"]["title"]);

      }
      else{
        print("Problema!!!");
        print(response.statusCode);
      }

       throw new Future.error('Erro ao retornar');
  }

}    