import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv_reminder_app/controllers/wishlist_controller.dart';
import 'package:my_tv_reminder_app/models/wishlist.dart';
import 'package:my_tv_reminder_app/ui/wishlist_details.dart';

class MyWishlistPage extends StatelessWidget {
  const MyWishlistPage({Key? key}) : super(key: key);

  @override
  void initState() {
    final WishlistController _wishlistController = Get.put(WishlistController());
    _wishlistController.getWishlist();
  }

  @override
  Widget build(BuildContext context) {
    var db = new  WishlistController();
    return Padding(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<List>(
        future: db.getWishlist(),
        builder: (context, AsyncSnapshot<List> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
               itemCount: snapshot.data?.length,
                itemBuilder: (context, index){
                  Wishlist wishlist = Wishlist.fromJson(snapshot.data![index]);
                return Card(
                  color: Colors.white70,
                  child: ListTile(
                    title: Text(wishlist.name.toString(),
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                    subtitle: Text(wishlist.episodeCount.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => WishlistDetailsPage(wishlist)));
                    },
                  ),
                );
                });
           }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
