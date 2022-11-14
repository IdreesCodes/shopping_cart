import 'package:shoppingcart_sql_provider/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
//import 'package:shoppingcart_sql_provider/Cart';
import 'package:path/path.dart';

class DBHelper {
 static Database? _db;
 Future<Database?> get db async {
   if(_db !=null){
     return _db!;
   }
   _db = await initDatabse();


 }
 initDatabse()async{
   io.Directory documentDirectory = await getApplicationDocumentsDirectory();
   String path = join(documentDirectory.path, 'cart.db');
   var db =await openDatabase(path, version: 1, onCreate: _onCreate);
   return db;
 }

 _onCreate( Database db, int version )async{
   await db.execute(
       'CREATE TABLE cart(id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE, productName TEXT, initialPrice INTEGER,productPrice INTEGER, quantity INTEGER, unitTag TEXT ,image TEXT)');
 }
 Future<Cart> insert (Cart cart ) async{
   print(cart.toMap());
   var dbClient = await db;
   await dbClient!.insert('cart', cart.toMap());
   return cart;

 }
 Future<List<Cart>>getCartList() async{

   var dbClient = await db;
   final List<Map<String, Object?>> queryResult = await dbClient!.query('cart');
   return queryResult.map((e) => Cart.fromMap(e)).toList();


 }


}