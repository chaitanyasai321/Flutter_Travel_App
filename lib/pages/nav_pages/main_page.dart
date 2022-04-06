import 'package:flutter/material.dart';
import 'package:flutter_cubit/pages/nav_pages/bar_item_page.dart';
import 'package:flutter_cubit/pages/nav_pages/home_page.dart';
import 'package:flutter_cubit/pages/nav_pages/my_page.dart';
import 'package:flutter_cubit/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages=[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int curIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     bottomNavigationBar:BottomNavigationBar(items: [
       BottomNavigationBarItem(icon: Icon(Icons.apps),title:Text("Home")),
       BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp),title:Text("Bar")),
       BottomNavigationBarItem(icon: Icon(Icons.search),title:Text("Search")),
       BottomNavigationBarItem(icon: Icon(Icons.person),title:Text("My")),
     ],
     onTap: (value) {
       setState(() {
         curIndex=value;
       });
     },
     currentIndex: curIndex,
     backgroundColor: Colors.white,
     type:BottomNavigationBarType.fixed,
     selectedItemColor:Colors.black54,
     unselectedItemColor: Colors.grey.withOpacity(0.5),
     selectedFontSize: 0,
     unselectedFontSize: 0,
     showSelectedLabels: true,
     showUnselectedLabels: false,
     elevation: 0,
     ) ,
     body:pages[curIndex]
    );
  }
}