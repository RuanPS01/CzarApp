import 'package:flutter/material.dart';
import 'package:characters/characters.dart';
import 'HomeScreenObjects/HomeScreen.dart';
import './MessagesScreen.dart';
import './MapScreen.dart';
import './CalendarScreen.dart';
import 'ProfileScreen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Czar App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MessagesScreen(),
    MapScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  var _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        children: [
          _widgetOptions.elementAt(0),
          _widgetOptions.elementAt(1),
          _widgetOptions.elementAt(2),
          _widgetOptions.elementAt(3),
          _widgetOptions.elementAt(4)
        ],
        onPageChanged: (value) {
          _onItemTapped(value);
          //widGetBarNav.selecIndex = value;
        },
        controller: _pageController,
      )),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Colors.cyan,
        strokeColor: Colors.cyan[100],
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: Icons.home,
          ),
          CustomNavigationBarItem(
            icon: Icons.message,
          ),
          CustomNavigationBarItem(
            icon: Icons.map,
          ),
          CustomNavigationBarItem(
            icon: Icons.calendar_today,
          ),
          CustomNavigationBarItem(
            icon: Icons.account_circle,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (indexSelected) {
          _onItemTapped(indexSelected);
          _pageController.animateToPage(indexSelected,
              duration: Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut);
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  int selecIndex = -1;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange,
      this.selecIndex});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState(selecIndex);
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  _CustomBottomNavigationBarState(valIndex) {
    if (valIndex != -1) _selectedIndex = valIndex;
  }

  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.cyan),
                ),
                gradient: LinearGradient(colors: [
                  Colors.cyan.withOpacity(0.3),
                  Colors.cyan.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.cyan : Colors.grey,
        ),
      ),
    );
  }
}
