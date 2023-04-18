/*import 'package:flutter_application_1/test/_1/view/coffeSection.dart';
import 'package:flutter_application_1/test/_1/view/mainCoffeePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainCoffeePage(),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_application_1/test//form1.dart';
import 'package:flutter_application_1/test//form10.dart';
import 'package:flutter_application_1/test//form11.dart';
import 'package:flutter_application_1/test//form12.dart';
import 'package:flutter_application_1/test//form13.dart';
import 'package:flutter_application_1/test//form14.dart';
import 'package:flutter_application_1/test//form15.dart';
import 'package:flutter_application_1/test//form16.dart';
import 'package:flutter_application_1/test//form18.dart';
import 'package:flutter_application_1/test//form2.dart';
import 'package:flutter_application_1/test//form20.dart';
import 'package:flutter_application_1/test//form21.dart';
import 'package:flutter_application_1/test//form22.dart';
import 'package:flutter_application_1/test//form23.dart';
import 'package:flutter_application_1/test//form24.dart';
import 'package:flutter_application_1/test//form25.dart';
import 'package:flutter_application_1/test//form26.dart';
import 'package:flutter_application_1/test//form27.dart';
import 'package:flutter_application_1/test//form28.dart';
import 'package:flutter_application_1/test//form29.dart';
import 'package:flutter_application_1/test//form3.dart';
import 'package:flutter_application_1/test//form30.dart';
import 'package:flutter_application_1/test//form31.dart';
import 'package:flutter_application_1/test//form32.dart';
import 'package:flutter_application_1/test//form33.dart';
import 'package:flutter_application_1/test//form34.dart';
import 'package:flutter_application_1/test//form35.dart';
import 'package:flutter_application_1/test//form36.dart';
import 'package:flutter_application_1/test//form37.dart';
import 'package:flutter_application_1/test//form38.dart';
import 'package:flutter_application_1/test//form39.dart';
import 'package:flutter_application_1/test//form4.dart';
import 'package:flutter_application_1/test//form40.dart';
import 'package:flutter_application_1/test//form41.dart';
import 'package:flutter_application_1/test//form42.dart';
import 'package:flutter_application_1/test//form43.dart';
import 'package:flutter_application_1/test//form5.dart';
import 'package:flutter_application_1/test//form6.dart';
import 'package:flutter_application_1/test//form7.dart';
import 'package:flutter_application_1/test//form8.dart';
import 'package:flutter_application_1/test//form9.dart';
import 'package:flutter_application_1/test/form17.dart';
import 'package:flutter_application_1/test/form44.dart';
import 'package:flutter_application_1/view/coffeSection.dart';
import 'package:flutter_application_1/view/mainCoffeePage.dart';
import 'package:shared_preferences/shared_preferences.dart';



  
 void main(){


   runApp(MyApp());

}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      routes:{
        //'/x':(context) =>forma23(), related to forma14
        '/x':(context) =>forma23(),
        '/y':(context) =>forma40(),
        },
      home:coffeeSc(),

    );
  }

 

}

  




























  /*
 
  related to forma42

  void main()async {
  
  bool start=await start_page();
  print(start);

   runApp(start==false?MyApp():forma3());

}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      routes:{
        '/x':(context) =>forma23(),
        '/y':(context) =>forma40(),
        },
      home:forma42() ,
    );
  }

 

}

  start_page()async async function returns future value
  {
    SharedPreferences obj=await SharedPreferences.getInstance();
    return obj.getBool('is_clicked')==null?false:true;
  }
  
  */
