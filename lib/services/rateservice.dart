import 'dart:convert';

import 'package:http/http.dart';
var baseurl ='http://data.fixer.io/api/';
var apikey = 'b83bc092bf056ab63be6da95429a75a3';

class Rateservice{
  
  Future<Map?> getrate()async{
    try{
      var res = await get(Uri.parse(baseurl+"latest?access_key="+apikey+"& symbols = USD,AUD,CAD,PLN,MXN"));
      var data = jsonDecode(res.body);
      print(data);
      if(res.statusCode==200){
        return data;
      }
    }catch(e){
     print(e);
    }
  }
}