import 'package:flutter/material.dart';
import 'package:lesson17/example.dart';
import 'package:lesson17/filter_menu_with_chips.dart';
import 'package:lesson17/image_and_tabbar_page.dart';
import 'package:lesson17/liste_ornek.dart';
import 'package:lesson17/nested_tab_bar_ornek.dart';
import 'package:lesson17/page_view_page.dart';
import 'package:lesson17/settings_expansion_menu.dart';
import 'package:lesson17/simple_image_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilterMenuWithChips(),
    );
  }
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  int bottomIndex = 0;
  var keyList = PageStorageKey("key liste");
  var keyExpansion = PageStorageKey("key expansion");
  late List<Widget> sayfalar;

  @override
  void initState() {
    super.initState();
    sayfalar = [
      ListeOrnek(listKey: keyList),
      //ExpansionTilePage(expansionKey: keyList),
      SettingsExpansionMenu(),
      PageViewPage(),
      SimpleImageSlider(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasarım Araçları"),
        backgroundColor: Colors.orangeAccent.shade100,
      ),

      body: sayfalar[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.orange.shade200,
        currentIndex: bottomIndex,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
          BottomNavigationBarItem(
            icon: Icon(Icons.expand_less_outlined),
            label: "Expansion",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Page View"),
          BottomNavigationBarItem(
            icon: Icon(Icons.slideshow_outlined),
            label: "Slider",
          ),
        ],
      ),
    );
  }
}
