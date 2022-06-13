import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/tabs/Home.dart';
import 'package:flutter_application_1/pages/tabs/Message.dart';
import 'package:flutter_application_1/pages/tabs/User.dart';
import 'package:flutter_application_1/pages/tabs/Find.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _currentIndex=0;

  List _pageList=[
    HomePage(),
    FindPage(),
    MessagePage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('萌宠园'),
      ),
      body:this._pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index){
          setState(() {
            this._currentIndex=index;
          });
        },
        type:BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label:'发现'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label:'消息'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label:'我的'
          ),
        ],
      )
    );
  }
}