import 'package:flutter/material.dart';

class NestedTabBarOrnek extends StatefulWidget {
  const NestedTabBarOrnek({super.key});

  @override
  State<NestedTabBarOrnek> createState() => _NestedTabBarOrnekState();
}

class _NestedTabBarOrnekState extends State<NestedTabBarOrnek> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("İç içe Sekmeli Tab"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent,
          bottom: TabBar(
            tabs: [
              Tab(text: "Yazlık"),
              Tab(text: "Kışlık"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InnerTabView(categoryName: "Yazlık"),
            InnerTabView(categoryName: "Kışlık"),
          ],
        ),
      ),
    );
  }
}

class InnerTabView extends StatelessWidget {
  final String categoryName;
  const InnerTabView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.green.shade300,
            tabs: [
              Tab(text: "Alt Kategori A"),
              Tab(text: "Alt Kategori B"),
              Tab(text: "Alt Kategori C"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text("$categoryName- Pantalon")),
                Center(child: Text("$categoryName- Gömlek")),
                Center(child: Text("$categoryName- KAzak")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
