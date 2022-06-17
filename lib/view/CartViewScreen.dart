import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/helper/databasehandler.dart';

import '../Resource/StyaleResources.dart';
import 'CheckoutScreen.dart';

class AddToCart extends StatefulWidget {
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  Future<List> alldata;

  var total = 0.0;
  var qty = 0;

  getdata() async {
    total = 0.0;
    DatabaseHandler obj = DatabaseHandler();
    setState(() {
      alldata = obj.viewcart();
      alldata.then((data) {
        for (var row in data) {
          setState(() {
            total = total +
                (double.parse(row["qty"].toString()) *
                    double.parse(row["price"].toString()));
          });
        }
      });
    });
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
        body: (alldata != null)
            ? SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future: alldata,
                        builder: (context, snapshots) {
                          if (snapshots.hasData) {
                            if (snapshots.data.length <= 0) {
                              return Center(
                                child: Text("No Data Available"),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: snapshots.data.length,
                                itemBuilder: (context, index) {
                                  // total = total + (double.parse(snapshots.data[index]["qty"].toString()) *
                                  //     double.parse(snapshots.data[index]["price"].toString()));

                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    color: Colors.red.shade100,
                                    margin: EdgeInsets.all(10),
                                    child: Row(children: [
                                      Expanded(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(snapshots.data[index]["pname"].toString(), style: TextStyle(fontSize: 17),
                                            ),
                                            Expanded(
                                                child: Container(
                                              padding: EdgeInsets.all(5),
                                              height: MediaQuery.of(context).size.height,
                                              width: MediaQuery.of(context).size.width/2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(snapshots.data[index]["pimage"].toString(),
                                                    ),
                                                    fit: BoxFit.fill),
                                              ),
                                            )
                                                //
                                                )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Text("quantity:- " + snapshots.data[index]["qty"].toString(),
                                                    style: TextStyle(fontWeight: FontWeight.bold),),
                                                  SizedBox(height: 10,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 40.0),
                                                    child: Row(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          child: Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            color: Colors.indigo
                                                                .shade500,
                                                            child: IconButton(
                                                              onPressed:
                                                                  () async {
                                                                DatabaseHandler obj =new DatabaseHandler();
                                                                await obj.updateqty("plus", snapshots.data[index]["pid"].toString());
                                                                getdata();
                                                              },
                                                              icon: Icon(
                                                                Icons.add,
                                                                size: 20,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(snapshots.data[index]["qty"].toString()),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          child: Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            color: Colors.indigo
                                                                .shade500,
                                                            child: IconButton(
                                                              onPressed:
                                                                  () async {
                                                                    DatabaseHandler obj =new DatabaseHandler();
                                                                    await obj.updateqty("minus", snapshots.data[index]["pid"].toString());
                                                                    getdata();
                                                              },
                                                              icon: Icon(
                                                                Icons.remove,
                                                                size: 20,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text("price:-" +
                                                      snapshots.data[index]
                                                              ["price"]
                                                          .toString()),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text("Total: " +
                                                      (double.parse(snapshots
                                                                  .data[index]
                                                                      ["qty"]
                                                                  .toString()) *
                                                              double.parse(snapshots
                                                                  .data[index]
                                                                      ["price"]
                                                                  .toString()))
                                                          .toString()),
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                DatabaseHandler obj =
                                                    new DatabaseHandler();
                                                await obj.deletecart(snapshots
                                                    .data[index]["cartid"]
                                                    .toString());
                                                getdata();
                                              },
                                              child: Text("Delete"),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rs." + total.toStringAsFixed(2)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CheckoutScreen(
                                          total: total.toStringAsFixed(2),
                                        )));
                              },
                              child: Text("Checkout"))
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
