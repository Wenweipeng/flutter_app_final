import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

const List<Tab> _tabs = [
  Tab(text: '推荐'),
  Tab(text: '同城市场'),
  Tab(text: '服务'),
  Tab(text: '商城'),
];

final List<Widget> _tabsContent = [
  Image.asset('assets/pic/pic1.png'),
  Image.asset('assets/pic/pic7.png'),
  Image.asset('assets/pic/pic5.png'),
  Image.asset('assets/pic/pic4.png'),
];

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late TabController _tabController;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabsContent,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: UserAccountsDrawerHeader(
                    accountName: Text("用户名"),
                    accountEmail: Text("邮箱"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://avatars3.githubusercontent.com/u/19098281?s=460&v=4"),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("我的空间"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text("用户中心"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text('设置中心'),
            ),
          ],
        ),
      ),
    );
  }
}