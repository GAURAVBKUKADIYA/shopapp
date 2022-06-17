import 'package:flutter/material.dart';
import 'package:shopapp/widgets/MyPrimaryButton.dart';

import 'LoginScreen.dart';

class Welcomepage extends StatefulWidget {


  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
            Center(
              child: Container(
                child: Image.asset("img/logo.webp",height:300,),
              ),
            ),
              SizedBox(height: 20,),
              Text("Wwlcome To Tastee",style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("order food from resutarent and",style: TextStyle(fontSize: 18),),
              Text("Make reservation in real time ",style: TextStyle(fontSize: 18),),

             SizedBox(height: 25,),
              MyPrimaryButton(

                onclick: ()async{

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>LoginScreen())
                  );

                },

                color: Colors.green,
                buttonText: "Login page"
              ),
              SizedBox(height: 10,
              ),
              MyPrimaryButton(
                onclick: ()async{

                },
                color:Colors.green ,
                buttonText: "Signup",
              )

            ],
          ),
        ),
      ),
    );
  }
}

