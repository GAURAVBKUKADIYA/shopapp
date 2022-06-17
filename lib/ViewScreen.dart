import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {


  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(Icons.message,color: Colors.white,),
          Expanded(
            child: Column(
              children: [
                Text("data"),
         Text("ndustry. Lorem Ipsum has been the industry's standard "
               "dummy text ever since the 1500s, when an unknown printer to"
               "ok a galley of type and scrambled it to make a type specimen"
               " book. It has survived not only five centuries, but also the leap"
               " publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            ),
          )
        ],
      ),
    );
  }
}
