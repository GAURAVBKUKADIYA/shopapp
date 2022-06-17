import 'package:flutter/material.dart';
import 'package:shopapp/widgets/MyPrimaryButton.dart';

import 'Registerscreen.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text("Log in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.black,),
                    hintText: "Eamil"
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,color: Colors.black,),
                    hintText: "password"
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MyPrimaryButton(
                onclick: ()async{

                },
                buttonText: "Login",
                color: Colors.red,
              ),
          SizedBox(height: 30,),
              Center(child:
              TextButton(onPressed: ()async{
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>Registerscreen())
                );
              },

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("NEwUser?"),
                      Text("Registernow",style: TextStyle(color: Colors.red),),
                    ],
                  )

              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
