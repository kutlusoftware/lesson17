import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFF5F8FB),
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
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Color(0xFFE04C7E),
                  borderRadius: BorderRadius.circular(32),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Color(0xFFE04C7E),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                indicatorSize: TabBarIndicatorSize.tab,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                tabs: [
                  Tab(
                    icon: Icon(Icons.local_offer_outlined, size: 24),
                    text: "Popüler",
                  ),
                  Tab(
                    icon: Icon(Icons.card_giftcard, size: 24),
                    text: "Yeni Gelen",
                  ),
                  Tab(
                    icon: Icon(Icons.card_giftcard, size: 24),
                    text: "Fırsatlar",
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                children: [
                  _buildGridView(context, 0),
                  _buildGridView(context, 1),
                  _buildGridView(context, 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context, int tabIndex) {
    // Her tab için örnek veri
    final List<Map<String, String>> data = [
      {
        "image":
            "https://upload.wikimedia.org/wikipedia/commons/6/6b/Esans_logo.png",
        "price": "100 ₺",
        "desc": "E-Şans Puan",
      },
      {
        "image":
            "https://seeklogo.com/images/O/opet-logo-6B2B7B7B4E-seeklogo.com.png",
        "price": "250 ₺",
        "desc": "Opet Yakıt Çeki",
      },
      {
        "image":
            "https://seeklogo.com/images/G/gastroclub-logo-5B1B7E1B7E-seeklogo.com.png",
        "price": "100 ₺",
        "desc": "GastroClub Kupon Kodu",
      },
    ];

    // Tab'a göre farklı veri göstermek isterseniz burada data'yı değiştirebilirsiniz.

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final item = data[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(item["image"]!, fit: BoxFit.contain),
                ),
                SizedBox(height: 8),
                Text(
                  item["price"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 4),
                Text(
                  item["desc"]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
