import 'package:my_tv_reminder_app/models/wishlist.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static final int _version = 1;
  static final String _tableName = "reminders";
  static final String _tableNameTvShow = "tvshows";
  static final String _tableNameComment = "comments";
  static final String _tableNameWishlist = "wishlist";

  static Future<void> initDatabase() async {
    if (_database != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'lumoz2.db';
      _database = await openDatabase(
          _path,
          version: _version,
          onCreate: (db, version) async {
            await db.execute(
              "CREATE TABLE $_tableNameTvShow("
                  "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "channel STRING, title STRING, image STRING, "
                  "description TEXT, season String, "
                  "isOngoing INTEGER)",
            );
            db.execute(
              "CREATE TABLE $_tableName("
                  "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "tvShow STRING, note TEXT, date STRING, "
                  "startTime STRING, endTime STRING, "
                  "reminder INTEGER, repeat STRING, "
                  "color INTEGER, "
                  "isCompleted INTEGER)",
            );
            db.execute(
              "CREATE TABLE $_tableNameWishlist("
                  "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "name STRING, episodeCount STRING, tvChanel STRING, "
                  "description STRING )",
            );
          }
      );
    } catch (e) {
      print(e);
    }
  }

  //Create
  static Future <int> createWishlist(Wishlist? wishlist) async {
    print("create wishlist function called");
    return await _database?.insert(_tableNameWishlist, wishlist!.toJson()) ?? 1;
  }
  //View
  static Future <List<Map<String, dynamic>>> queryWishlist() async {
    print("wishlist query function called");
    return await _database!.query(_tableNameWishlist);
  }
  //Delete
  static deleteWishlist(Wishlist wishlist) async {
    return await _database?.delete(
        _tableNameWishlist, where: 'id=?', whereArgs: [wishlist.id]);
  }
  //Update
   static updateWishlist(Wishlist wishlist) async {
       return await _database?.update(_tableNameWishlist, wishlist.toJson(), where: 'id=?', whereArgs: [wishlist.id]);
  }
}