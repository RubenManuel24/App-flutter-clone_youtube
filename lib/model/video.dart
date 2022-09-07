class Video {
   
   String id;
   String titulo;
   String descricao;
   String imagem;
   String canal;
   String data;

   Video({this.id='', this.titulo='', this.descricao='', this.imagem='', this.canal='', this.data=''});

   //Construtor nomeado com o nome fromJson para fazer a conersão de Json, map para video
    
    /*static convertJson(Map<String, dynamic> json){
      return Video(

        id: json["id"]["videoId"],
        titulo: json["snippet"]["title"],
        descricao: json["snippet"]["description"],
        imagem:  json["snippet"]["thumbnails"]["high"]["url"]["width"]["height"],
        canal: json["snippet"]["channelId"]

      );
    }*/
      
    factory  Video.fromJson(Map<String, dynamic> json){
      return Video(
        id: json["id"]["videoId"],
        titulo: json["snippet"]["title"],
        descricao: json["snippet"]["description"],
        imagem:  json["snippet"]["thumbnails"]["high"]["url"],
        canal: json["snippet"]["channelTitle"],
        data: json["snippet"]["publishTime"]

      );
   }

   


}
 