import 'package:flutter/material.dart';

class ExpansionTilePage extends StatefulWidget {
  final PageStorageKey expansionKey;
  const ExpansionTilePage({super.key, required this.expansionKey});

  @override
  State<ExpansionTilePage> createState() => _ExpansionTilePageState();
}

//ExpenionTile illa LisView içinde tanımlanma zorunluluğu yoktur
class _ExpansionTilePageState extends State<ExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: widget.expansionKey,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ExpansionTile(
          key: PageStorageKey(index),
          title: Text("Başık ${index + 1}"),
          leading: Icon(Icons.wb_sunny),
          //trailing: sağ tarftaki icon değiştirilebilir.
          //initiallyExpanded : en üsttekini yada hepsini default aaçık yapar.
          //maintainState: İçerik temizlensin mi temizlenmesin mi kapanınca onun bilgisini verir. Defult olarak falsedir.
          //tilePadding: Başlık alanının içini doldurur.,
          //onExpansionChanged: (value) {
          //açılıp açılmadığının bilgisini verir
          //},
          initiallyExpanded: index == 0 ? true : false,
          children: [
            Container(
              height: 200,
              color: index % 2 == 0 ? Colors.blueAccent : Colors.yellowAccent,
            ),
          ],
        );
      },
    );
  }
}
