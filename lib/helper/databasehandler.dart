import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {

  Database db;

  Future <Database> create_db()async{

    if(db==null)
      {
        Directory dir = await getApplicationDocumentsDirectory();
        String path = join(dir.path,"shop_db");
        var db = await openDatabase(path,version: 1,onCreate: create_table);
        return db;
      }
    else
    {
      return db;
    }
  }
  create_table(Database db, int verssion)async
  {
    db.execute("create table  cart (cartid integer primary key autoincrement,pid text ,pname text,pimage text, qty integer,price double)");
  }

  updateqty(str,pid) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from cart where pid=?",[pid]);
    var alldata = data.toList();
    var currqty = alldata[0]["qty"].toString();

    if(str=="plus")
      {
        await db.rawUpdate("update cart set qty=qty+1 where pid=?",[pid]);
      }
    else
      {
        if(double.parse(currqty)<=1)
        {
          await db.rawQuery("delete from cart where pid=?",[pid]);
        }
        else
          {
            await db.rawUpdate("update cart set qty=qty-1 where pid=?",[pid]);
          }
      }
  }

  Future<int> addtocart(pid,pname,pimage,price,qty) async
  {
    var db = await create_db();

    var data = await db.rawQuery("select * from cart where pid=?",[pid]);
    var alldata = data.toList();
    var id;
    if(alldata.length<=0)
      {
         id = await db.rawInsert("insert into cart (pid,pname,pimage,qty,price) values (?,?,?,?,?)",[pid,pname,pimage,qty,price]);
      }
    else
      {
         id = await db.rawUpdate("update cart set qty=qty+? where pid=?",[qty,pid]);
      }
    return id;
  }
  Future<List> viewcart() async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from cart");
    return data.toList();
  }
  Future<List> deletecart(cartid) async
  {
    var db = await create_db();
    var data = await db.rawQuery("delete from cart where cartid=?",[cartid]);
    return data.toList();
  }

  Future<List> getSingleShop(cartid) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from cart where cartid=?",[cartid]);
    return data.toList();
  }

}