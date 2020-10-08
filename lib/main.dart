import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:characters/characters.dart';
import 'HomeScreenObjects/HomeScreen.dart';
import './MessagesScreen.dart';
import './MapScreen.dart';
import './CalendarScreen.dart';
import 'ProfileScreen.dart';

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
      /*
      home: FloatingSearchBar.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(index.toString()),
          );
        },
        trailing: CircleAvatar(
          child: Text("RD"),
        ),
        drawer: Drawer(
          child: Container(),
        ),
        onChanged: (String value) {},
        onTap: () {},
        decoration: InputDecoration.collapsed(
          hintText: "Search...",
        ),
      ),
      */
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
    CustomBottomNavigationBar widGetBarNav = new CustomBottomNavigationBar(
      iconList: [
        Icons.home,
        Icons.message,
        Icons.map,
        Icons.calendar_today,
        Icons.person,
      ],
      onChange: (indexSelected) {
        _onItemTapped(indexSelected);
        _pageController.animateToPage(indexSelected,
            duration: Duration(milliseconds: 500),
            curve: Curves.linearToEaseOut);
      },
      defaultSelectedIndex: 0,
    );
    return Scaffold(
      /*
      appBar: CustomAppBar(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),E
            Text(''),
          ],
        ),
      ),
      */
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
          widGetBarNav.selecIndex = value;
        },
        controller: _pageController,
      )),
      /*
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.cyan,
            size: 30,
          ),
          Icon(
            Icons.message,
            color: Colors.cyan,
            size: 30,
          ),
          Icon(
            Icons.map,
            color: Colors.cyan,
            size: 30,
          ),
          Icon(
            Icons.calendar_today,
            color: Colors.cyan,
            size: 30,
          ),
          Icon(
            Icons.person,
            color: Colors.cyan,
            size: 30,
          ),
        ],
        onTap: (indexSelected) {
          _onItemTapped(indexSelected);
          _pageController.animateToPage(indexSelected,
              duration: Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut);
        },
        animationDuration: Duration(milliseconds: 150),
      ),

      
      bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(
              iconData: Icons.home,
              title: "Home",
            ),
            TabData(
              iconData: Icons.message,
              title: "Messages",
            ),
            /*
            TabData(
              iconData: Icons.map,
              title: "Map",
            ),
            */
            TabData(
              iconData: Icons.calendar_today,
              title: "Calendar",
            ),
            TabData(
              iconData: Icons.person,
              title: "Me",
            )
          ],
          initialSelection: _selectedIndex,
          onTabChangedListener: (position) {
            setState(() {
              _selectedIndex = position;
            });
          }),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.cyan),
            title: Text('Home', style: TextStyle(color: Colors.cyan)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.cyan),
            title: Text('Messages', style: TextStyle(color: Colors.cyan)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: Colors.cyan),
            title: Text('Map', style: TextStyle(color: Colors.cyan)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.cyan),
            title: Text('Calendar', style: TextStyle(color: Colors.cyan)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.cyan),
            title: Text('Me', style: TextStyle(color: Colors.cyan)),
          ),
        ],
        currentIndex: _selectedIndex,
        iconSize: 25,
        onTap: (indexSelected) {
          _onItemTapped(indexSelected);
          _pageController.animateToPage(indexSelected,
              duration: Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut);
        },
      ),
      */
      bottomNavigationBar: widGetBarNav,
      /*
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.message,
          Icons.map,
          Icons.calendar_today,
          Icons.person,
        ],
        onChange: (indexSelected) {
          _onItemTapped(indexSelected);
          _pageController.animateToPage(indexSelected,
              duration: Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut);
        },
        defaultSelectedIndex: 0,
      ),
      */
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
