import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_model.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<NewsModel?> fetchdata({required String NewsCategory}) async {
   try{
     String apikey =
         "https://newsapi.org/v2/top-headlines?country=in&category=$NewsCategory&apiKey=5364b448d6ea422eb32e4f2ff910a2d8";

     http.Response res = await http.get(Uri.parse(apikey));
     if (res.statusCode == 200) {
       String data = res.body;
       Map<String,dynamic> decodeddata = jsonDecode(data);

       NewsModel newsModel =  NewsModel.fromJson(json: decodeddata);

       return newsModel;
     }else{
       print("Errror : ${res.statusCode}");

     }
   }catch (e){
     print("Error : $e");

   }


  }
}
