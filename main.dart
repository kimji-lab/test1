import 'package:flutter/material.dart';
import 'package:pertemuan_mcc4/settingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(isDarkTheme: false)
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.isDarkTheme}); // gapake const supaya bisa bikin light dan dark theme, karena const itu tetap
  bool isDarkTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: widget.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(

        appBar: AppBar(
          title: Text("Home"),
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return SettingPage(isDarkTheme: widget.isDarkTheme);
                  },));
                },
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
