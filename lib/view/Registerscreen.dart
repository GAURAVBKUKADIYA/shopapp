import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/view/LoginScreen.dart';

class Registerscreen extends StatefulWidget {


  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {

  TextEditingController _name = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirmpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: SafeArea(
      child: Container(
          margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.black,),
                  hintText: "Name"
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _username,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.black,),
                  hintText: "UserName"
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _pass,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.black,),
                  hintText: "password"
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _confirmpass,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.black,),
                  hintText: "confirmpassword"
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: ()async{

                  },

                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text("Cancle",style: TextStyle(fontSize: 20,color: Colors.white),),

                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: ()async{
                    var name = _name.text.toString();
                    var ussername = _username.text.toString();
                    var pass = _pass.text.toString();
                    var confirmpass = _confirmpass.text.toString();

                    if(name.length<=0)
                      {
                      final snackBar = SnackBar(
                      content: const Text('name is empty',style: TextStyle(fontSize: 20),),
                      action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                      // Some code to undo the change.
                      },
                      ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }
                    else if(ussername.length<=0)
                      {

                        final snackBar = SnackBar(
                          content: const Text('user is empty',style: TextStyle(fontSize: 20),),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    else if(pass.length<=0)
                      {
                        final snackBar = SnackBar(
                          content: const Text('password is empty',style: TextStyle(fontSize: 20),),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }
                    else if(confirmpass.length<=0)
                      {
                        final snackBar = SnackBar(
                          content: const Text('confirm password is empty',style: TextStyle(fontSize: 20),),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {

                            },),);


                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    else if(pass != confirmpass)
                      {
                        final snackBar = SnackBar(
                          content: const Text('password and confirm password does not match',style: TextStyle(fontSize: 20),),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {

                            },),);


                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    else{
                      final snackBar = SnackBar(
                        content: const Text('sucsess full register',style: TextStyle(fontSize: 20),),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {

                          },),);


                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>LoginScreen())
                    );

                  },

                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text("Register",style: TextStyle(fontSize: 20,color: Colors.white),),

                  ),
                ),

              ]
          ),


        ],
      ),
    ),
      ),
    );
  }
}
