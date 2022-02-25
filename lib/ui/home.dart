import 'package:convert_test/bloc/ratebloc.dart';
import 'package:convert_test/component/input.dart';
import 'package:convert_test/component/text.dart';
import 'package:convert_test/services/rateservice.dart';
import 'package:convert_test/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'graph.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
TextEditingController input = TextEditingController();
TextEditingController output = TextEditingController();

late Ratebloc ratebloc;

  @override
  Widget build(BuildContext context) {
     ratebloc = Provider.of<Ratebloc>(context);
    return Scaffold(
        body: SafeArea(
          child:ratebloc.ratemodel==null?const Center(child: CircularProgressIndicator())
              :SingleChildScrollView(
               child: Column(
                 children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        Icon(Icons.sort,color: kgreen,),
                         Text("Sign up",
                          style:TextStyle(
                           fontWeight:FontWeight.w600,
                           color: kgreen,
                           fontSize: 20,
                         ),)
                       ],
                     ),
                     const SizedBox(height: 50,),
                     text('Currency', 35,fontWeight: FontWeight.w800,color:kblue),
                     Row(
                       children: [
                         text('calculation', 35,fontWeight: FontWeight.w800,color:kblue),
                         text('.', 40,fontWeight: FontWeight.w700,color:kgreen),
                       ],
                     ),
                     const SizedBox(height: 40,),
                     field(input,"EUR"),
                     const SizedBox(height:15,),
                     field(output,"PLN"),
                     const SizedBox(height:45,),
                     Row(
                       children: [
                         drop(),
                         const Spacer(),
                         const Icon(Icons.swap_horiz,size: 30,color: Colors.grey,),
                         const Spacer(),
                         drop1(),
                       ],
                     ),
                     const SizedBox(height:35,),
                     SizedBox(
                       width: double.maxFinite,
                       height: 55,
                       child: FlatButton(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(5),
                         ),
                           onPressed: (){

                          },
                           color: kgreen,
                           child: text('Convert', 20,color: Colors.white)),
                     ),
                     const SizedBox(height:35,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Mid-market exchange rate at 13,38UTC",
                           style:TextStyle(
                             fontWeight:FontWeight.w600,
                             decoration:TextDecoration.underline,
                             color:Colors.blue[500],
                             fontSize: 13,
                           ),),
                        const SizedBox(width: 10,),
                         CircleAvatar(
                           backgroundColor: Colors.grey[300],
                           radius: 10,
                           child: text("i", 17,color: Colors.blue[800]),
                         )
                       ],
                     )

                   ],
                  ),
                ),
                   const SizedBox(height: 20,),
                   Graph()
               // Graph()
              ],
            ),
          ),
        ),
    );
  }

 Widget drop() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 0.8,
          color: const Color.fromRGBO(226,226,226, 1),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 30,
          child: DropdownButton<String>(
            underline:const SizedBox(),
            icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey[500],size: 30,),
            value: 'USD',
            items: <String>['USD', "PLN",].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Icon(Icons.monetization_on,color: kblue,),
                    const SizedBox(width: 10,),
                    text(value, 19,color: Colors.grey[600],fontWeight:FontWeight.w500),
                   const SizedBox(width:10,),
                  ],
                ),
              );
            }).toList(),
            onChanged: (e) {

            },
          ),
        ),
      ),
    );
 }

Widget drop1() {
    var list = ratebloc.ratemodel?.rates.toJson().entries.toList();
    //print(list.runtimeType);
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 0.8,
          color: const Color.fromRGBO(226,226,226, 1),
        )
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 30,
        child: DropdownButton<MapEntry<String, dynamic>?>(
          underline:const SizedBox(),
          icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey[500],size: 30,),
          value: list?[0],
          items: list?.map((value) {
            return DropdownMenuItem<MapEntry<String, dynamic>>(
              value: value,
              child: Row(
                children: [
                  Icon(Icons.monetization_on,color: kblue,),
                  const SizedBox(width: 10,),
                  text(value.key, 19,color: Colors.grey[600],fontWeight:FontWeight.w500),
                  const SizedBox(width:10,),
                ],
              ),
            );
          }).toList(),
          onChanged: (e) {

          },
        ),
      ),
    ),
  );
}

  void getrate() {
    if(ratebloc.ratemodel==null){
      ratebloc.getrate();
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 200),(){getrate();});
  }
}
