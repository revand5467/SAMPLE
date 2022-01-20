import 'package:flutter/material.dart';

void main() => runApp(ContactProfilePage());
enum APP_THEME { LIGHT, DARK }

class MyAppThemes {
  static ThemeData appThemeLight() {
    return ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
            color: Colors.orangeAccent,
            iconTheme: IconThemeData(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.pinkAccent),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ));
  }

  static ThemeData appThemeDark() {
    return ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
            color: Colors.black,
            iconTheme: IconThemeData(color: Colors.orangeAccent)),
        iconTheme: IconThemeData(color: Colors.orange),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ));
  }
}

class ContactProfilePage extends StatefulWidget {
  @override
  _ContactProfilePageState createState() => _ContactProfilePageState();
}

class _ContactProfilePageState extends State<ContactProfilePage> {
  @override
  var currentTheme = APP_THEME.LIGHT;
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //NEW CODE: theme property
        theme: currentTheme == APP_THEME.DARK
            ? MyAppThemes.appThemeDark()
            : MyAppThemes.appThemeLight(),
        home: Scaffold(
            appBar: AppBar(
              //backgroundColor: Colors.white,
              leading: Icon(
                Icons.arrow_back,
                //color: Colors.black,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.star_border),
                  //color: Colors.black,
                  onPressed: () {
                    print("Contact is starred");
                  },
                ),
              ],
            ),
            //NEW CODE: Added container
            body: buildBodyWidget(),
            floatingActionButton: FloatingActionButton(
                child: IconButton(
                    icon: Icon(Icons.threesixty),
                    onPressed: () {
                      setState(() {
                        currentTheme == APP_THEME.LIGHT
                            ? currentTheme = APP_THEME.DARK
                            : currentTheme = APP_THEME.LIGHT;
                      });
                    }),
                onPressed: () {})));
  }

  Widget buildCallButton() {
    return Column(children: <Widget>[
      IconButton(
          icon: Icon(
            Icons.call,
            //color: Colors.indigo.shade800
          ),
          onPressed: () {}),
      Text("Call", style: TextStyle(color: Colors.indigo.shade800))
    ]);
  }

  Widget buildTextButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.message,
            //color: Colors.indigo.shade800,
          ),
          onPressed: () {},
        ),
        Text("Text", style: TextStyle(color: Colors.indigo.shade800)),
      ],
    );
  }

  Widget buildEmailButton() {
    return Column(children: <Widget>[
      IconButton(
          icon: Icon(
            Icons.email,
            //color: Colors.indigo.shade800
          ),
          onPressed: () {}),
      Text("Email", style: TextStyle(color: Colors.indigo.shade800))
    ]);
  }

  Widget buildVideoButton() {
    return Column(children: <Widget>[
      IconButton(
          icon: Icon(
            Icons.video_call,
            //color: Colors.indigo.shade800
          ),
          onPressed: () {}),
      Text("Video Call", style: TextStyle(color: Colors.indigo.shade800))
    ]);
  }

  Widget buildPayButton() {
    return Column(children: <Widget>[
      IconButton(
          icon: Icon(
            Icons.attach_money,
            //color: Colors.indigo.shade800
          ),
          onPressed: () {}),
      Text("Pay", style: TextStyle(color: Colors.indigo.shade800))
    ]);
  }

  Widget buildDirectionButton() {
    return Column(children: <Widget>[
      IconButton(
          icon: Icon(
            Icons.directions,
            //color: Colors.indigo.shade800
          ),
          onPressed: () {}),
      Text("Directions", style: TextStyle(color: Colors.indigo.shade800))
    ]);
  }

  Widget PhoneNumber() {
    return ListTile(
        leading: Icon(Icons.phone),
        title: Text("55555555"),
        subtitle: Text("mobile"),
        trailing: IconButton(
            icon: Icon(Icons.phone),
            //color: Colors.indigo.shade800,
            onPressed: () {}));
  }

  Widget OtherPhoneNumber() {
    return ListTile(
        leading: Text(" "),
        title: Text("444444"),
        subtitle: Text("other"),
        trailing: IconButton(
            icon: Icon(Icons.phone),
            //color: Colors.indigo.shade800,
            onPressed: () {}));
  }

  Widget EmailAddress() {
    return ListTile(
        leading: Icon(Icons.email),
        title: Text("revandsunil5467@gmail.com"),
        subtitle: Text("email"));
  }

  Widget Address() {
    return ListTile(
        leading: Icon(Icons.location_on),
        title: Text("Antartica"),
        subtitle: Text("address"),
        trailing: IconButton(
            icon: Icon(Icons.directions),
            //color: Colors.indigo.shade800,
            onPressed: () {}));
  }

  Widget pofilActioItems() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildCallButton(),
          buildEmailButton(),
          buildVideoButton(),
          buildTextButton(),
          buildPayButton(),
          buildDirectionButton(),
        ]);
  }

  Widget buildBodyWidget() {
    return ListView(children: <Widget>[
      Column(children: <Widget>[
        Container(
          width: double.infinity,
          child: Image.network(
            "https://raw.githubusercontent.com/revand5467/pic/main/TokyoRevengers.jpg",
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("Tokyo Revengers",
                          style: TextStyle(fontSize: 30)))
                ])),
        Divider(color: Colors.grey),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          child: Theme(
            data: ThemeData(
                iconTheme: IconThemeData(
              color: Colors.pink,
            )),
            child: pofilActioItems(),
          ),
        ),
        Divider(color: Colors.grey),
        PhoneNumber(),
        OtherPhoneNumber(),
        Divider(color: Colors.grey),
        EmailAddress(),
        Divider(color: Colors.grey),
        Address()
      ])
    ]);
  }
}
