import 'package:flutter/material.dart';
import 'package:rotary/Blog/blog.dart';
import 'package:rotary/Media/media.dart';
import 'package:rotary/browse/browse.dart';
import 'package:rotary/Gallery/gallery.dart';



class Navbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavbarState();
  }
}

class _NavbarState extends State<Navbar> {

  int _selectedIndex = 0;
  final Gallery _gallery = Gallery();
  final Browse _browse = Browse();
  final Blog _blog = Blog();
  final Media _media = Media();

  Widget _showpage = new Browse();

  Widget _pagechooser(int page) {
    switch (page) {
      case 0:
        return _browse;
        break;
      case 1:
        return _gallery;
        break;
      case 2:
        return _media;
      case 3:
        return _blog;
        break;
      default:
        return _browse;
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
      _showpage = _pagechooser(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_library,
                size: 20,
              ),
              title: Text('Gallery'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.live_tv,
                size: 20,
              ),
              title: Text("Media"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_to_queue,
                size: 20,
              ),
              title: Text("Blog"),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff005daa),
        onTap: _onItemTapped,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: _showpage,
        ),
      ),
    );
  }
}