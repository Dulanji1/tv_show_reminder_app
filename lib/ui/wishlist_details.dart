import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv_reminder_app/controllers/wishlist_controller.dart';
import 'package:my_tv_reminder_app/models/wishlist.dart';
import 'package:my_tv_reminder_app/ui/wishlist_screen.dart';
import 'edit_serices.dart';

class WishlistDetailsPage extends StatefulWidget {
  final Wishlist wishlist;
  const WishlistDetailsPage(
      this.wishlist, {
        Key? key,
      }) : super(key: key);

  @override
  State<WishlistDetailsPage> createState() {
    return new _WishlistDetailsPageState();
  }
}

class _WishlistDetailsPageState extends State<WishlistDetailsPage> {
  final WishlistController _wishlistController = Get.put(WishlistController());

  @override
  void initState() {
    super.initState();
    _wishlistController.getWishlist();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tv Series Details"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Tv Series Wish List',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                    "Tv Series Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.wishlist.name.toString()),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Episode Count",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.wishlist.episodeCount.toString()),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Tv Chanel",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.wishlist.tvChanel.toString()),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.wishlist.description.toString()),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton.icon(
                        icon: Icon(Icons.edit,
                                color: Colors.white
                            ), // Your icon here
                            label: Text(
                              "Edit",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              textStyle:  MaterialStateProperty.all(TextStyle(fontSize: 20)),
                            ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditSeries(widget.wishlist)));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3,right: 3),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        icon: Icon(Icons.delete,
                            color: Colors.white
                        ), // Your icon here
                        label: Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                          textStyle:  MaterialStateProperty.all(TextStyle(fontSize: 20)),
                        ),
                        onPressed: () {
                          showDialog(context: context, builder:(BuildContext context){
                            return new AlertDialog(
                              title: Text("Confirm"),
                              content: Text("Are you sure?"),
                              actions: <Widget>[
                                FlatButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      var wishlist = new Wishlist();
                                      // var db = WishlistController();
                                      _wishlistController.deleteWishlist(widget.wishlist);
                                      // Get.back();
                                     // await db.deleteWishlist(wishlist);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>Wishlist_Screen()));
                                  },
                                ),
                                FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3,right: 3),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        icon: Icon(Icons.cancel,
                            color: Colors.white
                        ), // Your icon here
                        label: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                          textStyle:  MaterialStateProperty.all(TextStyle(fontSize: 20)),
                        ),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Wishlist_Screen()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}