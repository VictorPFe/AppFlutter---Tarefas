import 'package:flutter/material.dart';
import 'package:my_app/taskListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabNavigator(),
    );
  }
}

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    HomeScreen(),
    TaskListScreen()
  ];

  void _onTabSelected(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        elevation: 9,
  
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black, ),
            label: 'Tela Inicial'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.black,),
            label: 'Tarefas'
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Tela Inicial",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
