import 'package:flutter/material.dart';
import 'package:my_tv_reminder_app/controllers/wishlist_controller.dart';
import 'package:my_tv_reminder_app/database/database_helper.dart';
import 'package:my_tv_reminder_app/main.dart';
import 'package:my_tv_reminder_app/models/wishlist.dart';
import 'package:my_tv_reminder_app/ui/wishlist_screen.dart';

class EditSeries extends StatefulWidget {
  Wishlist wishlist;
   EditSeries(
      this.wishlist, {
        Key? key,
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new EditSeriesState();
  }
}

class EditSeriesState extends State<EditSeries> {
  var textEditingControllerName = new TextEditingController();
  var textEditingControllerEpisodeCount = new TextEditingController();
  var textEditingControllerTvChanel= new TextEditingController();
  var textEditingControllerDescription = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    textEditingControllerName.text = widget.wishlist.name.toString();
    textEditingControllerEpisodeCount.text = widget.wishlist.episodeCount.toString();
    textEditingControllerTvChanel.text = widget.wishlist.tvChanel.toString();
    textEditingControllerDescription.text = widget.wishlist.description.toString();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Edit Tv Series"),
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
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Name"
                  ),
                  controller: textEditingControllerName,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Episode Count"
                  ),
                  controller: textEditingControllerEpisodeCount,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Tv Chanel"
                  ),
                  controller: textEditingControllerTvChanel,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Description"
                  ),
                  controller: textEditingControllerDescription,
                  maxLines: 5,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
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
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                          textStyle:  MaterialStateProperty.all(TextStyle(fontSize: 20)),
                        ),
                        onPressed: () {
                          widget.wishlist.name = textEditingControllerName.text;
                          widget.wishlist.episodeCount = textEditingControllerEpisodeCount.text;
                          widget.wishlist.tvChanel = textEditingControllerTvChanel.text;
                          widget.wishlist.description = textEditingControllerDescription.text;
                          var db = WishlistController();
                           db.updateWishlist(widget.wishlist);
                               Navigator.push(context,MaterialPageRoute(builder: (context)=>Wishlist_Screen()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5,right: 5),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        icon: Icon(Icons.cancel,
                            color: Colors.white
                        ), // Your icon here
                        label: Text(
                          "Cancle",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
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