import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movie_app/helper/hex_color.dart';

class CurvedBottomNavigationBarPage extends BottomNavigationBarPage {
  CurvedBottomNavigationBarPage()
      : super(
            title: 'TMDB', subtitle: 'Package: curved_navigation_bar: ^1.0.1');

  @override
  _CurvedBottomNavigationBarState createState() =>
      _CurvedBottomNavigationBarState();
}

class _CurvedBottomNavigationBarState
    extends State<CurvedBottomNavigationBarPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
        backgroundColor: HexColor("002238"),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: this.widget.content,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: this.widget.navigationIcons.map((icon) => icon).toList(),
        color: HexColor("002238"),
      ),
    );
  }
}

abstract class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;
  final List<Widget> content = const <Widget>[
    ContentPage(content: 'Schedule'),
    ContentPage(content: 'Contacts'),
    ContentPage(content: 'Bills'),
    ContentPage(content: 'Notes'),
    ContentPage(content: 'Settings')
  ];
  final navigationTitles = const [
    'Schedule',
    'Contacts',
    'Bills',
    'Notes',
    'Settings'
  ];
  final navigationIcons = const [
    Icon(Icons.movie, color: Colors.white),
    Icon(Icons.tv, color: Colors.white),
    Icon(Icons.person, color: Colors.white),
    Icon(Icons.search, color: Colors.white),
    Icon(Icons.settings, color: Colors.white)
  ];
}

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key, this.content = ''}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          content,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
