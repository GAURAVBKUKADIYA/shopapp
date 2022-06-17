import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/helper/databasehandler.dart';
import 'package:shopapp/view/CartViewScreen.dart';

import '../Models/Shop.dart';
import '../Resource/StyaleResources.dart';


class ProductFullInformation extends StatefulWidget {

  Shopping obj;
  ProductFullInformation({this.obj});
  @override
  State<ProductFullInformation> createState() => _ProductFullInformationState();
}

class _ProductFullInformationState extends State<ProductFullInformation> {

  var qty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [

             Container(
               alignment: Alignment.topRight,
               child:IconButton(onPressed: ()async{

                 Navigator.of(context).push(
                   MaterialPageRoute(builder: (context)=>AddToCart())
                 );

               },

                   icon: Icon(Icons.shopping_cart,size: 41,)
               ),
             ),

                Container(

                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(widget.obj.image),
                          fit:BoxFit.fill
                      ),
                    ),child: Card(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  shadowColor: Colors.grey,

                )),
                SizedBox(height: 10,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.obj.title),
                      Divider(height: 10,thickness: 2,color: Colors.blue,),
                      Text("Price:  "+widget.obj.price.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  color: Colors.indigo.shade500,
                                  child: IconButton(
                                    onPressed: ()async{
                                      setState(() {
                                        qty=qty+1;
                                      });
                                    },
                                    icon: Icon(Icons.add,size: 20,color: Colors.white,),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Text(qty.toString()),
                              SizedBox(width: 5,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(

                                  width: 30.0,
                                  height: 30.0,
                                  color: Colors.indigo.shade500,
                                  child: IconButton(
                                    onPressed: ()async{

                                      if(qty>0)
                                      {
                                        setState(() {
                                          qty=qty-1;
                                        });
                                      }


                                    },
                                    icon: Icon(Icons.remove,size: 20,color: Colors.white,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child:  Text("Good Fabrics",style: StyaleResources.primaryclickstyletext,),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child:GestureDetector(
                          onTap: ()async{

                            if(qty<=0)
                              {

                                final snackBar = SnackBar(
                                  content: const Text('Plese select Quantety'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );

                                // Find the ScaffoldMessenger in the widget tree
                                // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

                      else{
                              DatabaseHandler db = new DatabaseHandler();
                              db.addtocart(widget.obj.id.toString(),widget.obj.title , widget.obj.image.toString(),
                                  widget.obj.price.toString(), qty);
                              Fluttertoast.showToast(
                                  msg: "Product Add Sucsess Fully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );

                            }




                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Text("Add To Cart",style: TextStyle(fontSize: 25,color: Colors.white),),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
