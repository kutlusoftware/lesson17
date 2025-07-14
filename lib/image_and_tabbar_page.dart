import 'package:flutter/material.dart';

class ImageAndTabbarPage extends StatefulWidget {
  const ImageAndTabbarPage({super.key});

  @override
  State<ImageAndTabbarPage> createState() => _ImageAndTabbarPageState();
}

class _ImageAndTabbarPageState extends State<ImageAndTabbarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //tanımlanan kadar Tabbar length sayısı verilir.
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resim + Tabbar"),
          backgroundColor: Colors.brown.shade400,
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/id/1011/800/400"),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Ürün Başlığı",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  shadows: [Shadow(blurRadius: 8, color: Colors.red)],
                ),
              ),
            ),
            //Tabbar
            TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.green,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(text: "Açıklama"),
                Tab(text: "Yorum"),
                Tab(text: "Detay"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("data")),
                  Center(child: Text("sds")),
                  Center(child: Text("sdsd")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
