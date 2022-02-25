import 'package:convert_test/model/ratemodel.dart';
import 'package:convert_test/services/rateservice.dart';
import 'package:flutter/cupertino.dart';

class Ratebloc extends ChangeNotifier{

  Ratemodel? ratemodel;
 int index =0;
  Future<Ratemodel?> getrate()async{
    var data = await Rateservice().getrate();
    if(data!=null){
      ratemodel=Ratemodel.fromJson(data);
      notifyListeners();
    }

  }

  setindex(int d){
   index=d;
   notifyListeners();
  }
}