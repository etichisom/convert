import 'package:convert_test/component/text.dart';
import 'package:flutter/material.dart';

Widget field(TextEditingController controller,String suffix){
   return Container(
     height: 55,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(4),
       color: const Color.fromRGBO(226,226,226, 0.2),
     ),
     child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
         border: InputBorder.none,
         //filled: true,
         //fillColor:const Color.fromRGBO(226,226,226, 0.3),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(suffix, 19,color: Colors.grey[400],fontWeight:FontWeight.w600),
              ],
            ),
          )
      ),
     ),
   );
}