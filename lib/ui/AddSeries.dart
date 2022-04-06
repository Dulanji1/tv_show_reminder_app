import 'package:flutter/material.dart';
import 'package:my_tv_reminder_app/controllers/wishlist_controller.dart';
import 'package:my_tv_reminder_app/models/wishlist.dart';
import 'package:my_tv_reminder_app/ui/wishlist_screen.dart';

class AddSeries extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddSeriesState();
  }
}
class AddSeriesState extends State<AddSeries> {
  var textEditingControllerName = new TextEditingController();
  var textEditingControllerEpisodeCount = new TextEditingController();
  var textEditingControllerTvChanel = new TextEditingController();
  var textEditingControllerDescription = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add Tv Series"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
           
              child: Form(
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
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: textEditingControllerName,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Series',
                        labelText: 'Series',
                      )
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: textEditingControllerEpisodeCount,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Episode Count',
                        labelText: 'Episode Count',
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: textEditingControllerTvChanel,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Tv Chanel',
                        labelText: 'Tv Chanel',
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: textEditingControllerDescription,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Description',
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextButton.icon(
                            icon: Icon(Icons.save,
                                color: Colors.white
                            ), // Your icon here
                            label: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors
                                  .green),
                              textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 20)),
                            ),
                            onPressed: () {
                              if(textEditingControllerName.value.text.length == 0){
                                    showDialog(context: context, builder:(BuildContext context){
                                    return new AlertDialog(
                                      title: Text("Alert !!!"),
                                      content: Text("Series Name Feild Can\'t Be Empty."),
                                      actions: <Widget>[
                                      FlatButton(
                                        child: Text("Ok"),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        ),
                                       ],
                                      );
                                     });
                                 }else {
                                var wishlist = new Wishlist(
                                  name: textEditingControllerName.text,
                                  episodeCount: textEditingControllerEpisodeCount
                                      .text,
                                  tvChanel: textEditingControllerTvChanel.text,
                                  description: textEditingControllerDescription
                                      .text,
                                );
                                var db = WishlistController();
                                db.addWishlist(wishlist: wishlist);
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Wishlist_Screen()));
                              }
                              },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
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
                              backgroundColor: MaterialStateProperty.all(Colors
                                  .red),
                              textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 20)),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Wishlist_Screen()));
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
        ),
      );
  }
}