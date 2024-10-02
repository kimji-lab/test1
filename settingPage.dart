import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({super.key, required this.isDarkTheme});
  bool isDarkTheme;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: widget.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(

        appBar: AppBar(
            title: Text("Setting"),
            actions: [

              TextButton(onPressed: (){}, child: Text("Button")),

              PopupMenuButton(itemBuilder: (context) => [
                PopupMenuItem(child: Row(
                    children: [
                      Icon(Icons.star),
                      Text("Change Themes")
                    ]
                ),
                  onTap : (){
                    setState(() {
                      widget.isDarkTheme = !widget.isDarkTheme;
                    });
                  },),


                PopupMenuItem(child: Row(
                    children: [
                      Icon(Icons.door_back_door),
                      Text("Log Out")
                    ]
                )),
              ]),
            ]
        ),

        drawer: Drawer(
          child: ListView(
              children: [
                UserAccountsDrawerHeader(accountName: Text("Winter")
                    , accountEmail: Text("winter1@gmail.com")
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Setting"),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Account"),
                ),
              ]
          ),
        ),

      ),
    );
  }
}
