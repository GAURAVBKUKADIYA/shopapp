import 'package:flutter/material.dart';
import 'package:shopapp/Models/Shop.dart';
import 'package:shopapp/utility/ErrorHandler.dart';
import 'package:http/http.dart'as http;
import '../Resources/UrlResources.dart';
import '../utility/ApiHAndler.dart';
import 'ProductFullInformation.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ProductApiList extends StatefulWidget {


  @override
  State<ProductApiList> createState() => _ProductApiListState();
}

class _ProductApiListState extends State<ProductApiList> {

  List<Shopping>alldata;

  getdata()async{

    try{
      await ApiHandler.get(UrlResources.SHOP).then((json){
        setState(() {
         alldata  = json.map<Shopping>((obj)=>Shopping.fromJson(obj)).toList();
        });
      });
    }
    on ErrorHandler catch (ex)
    {
      if (ex.code.toString()=="500")
        {
          print("No InterNet");
        }
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (alldata!=null)?SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0
          ),
          itemCount: alldata.length,
          itemBuilder: (context,index){
             return Container(
               height: 500,
               margin: EdgeInsets.all(5),
               child: GestureDetector(
                 onTap: ()async{
                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (context)=>ProductFullInformation(obj: alldata[index])
                       ));
                 },
                 child: Card(
                   elevation: 5.0,
                   child: Column(
                     children: [
                       Expanded(
                         child:   Container(
                             height: MediaQuery.of(context).size.height,
                             width: MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               image: DecorationImage(
                                   image: NetworkImage(alldata[index].image.toString()),
                                   fit:BoxFit.cover
                               ),
                             ),child: Card(
                           color: Colors.transparent,
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),


                         )),
                         //child: Image.network()
                       ),

                       Container(
                         padding: EdgeInsets.all(10.0),
                         child: Column(
                           children: [
                             Text(alldata[index].title.toString()),
                             Text(alldata[index].price.toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               ),
             );
          },
        )
               ):Center(child: CircularProgressIndicator(),)
             );
  }
}
