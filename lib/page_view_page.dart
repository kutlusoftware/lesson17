import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  bool yatayEksen = true;
  bool isPageSnapping = true;
  int currentIndex = 0;
  //PageController pageController = PageController();
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            //dokunduğumuzda diğer sayfaya geçsin mi yoksa harekete göre kalsın mı ? Default truedur
            pageSnapping: isPageSnapping,
            scrollDirection: yatayEksen ? Axis.horizontal : Axis.vertical,
            controller: pageController,
            onPageChanged: (value) {
              debugPrint("Sayfa index: $value");
              setState(() {
                currentIndex = value;
              });
            },
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.purpleAccent.shade100,
                child: Center(
                  child: Text(
                    "Sayfa 0",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.indigoAccent.shade100,
                child: Center(
                  child: Text(
                    "Sayfa 1",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.yellowAccent.shade100,
                child: Center(
                  child: Text(
                    "Sayfa 2",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Container(
            height: 200,
            width: double.infinity,
            color: Colors.lightBlue.shade200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: currentIndex == 0
                          ? null
                          : () {
                              pageController.previousPage(
                                duration: Duration(seconds: 2),
                                curve: Curves.easeIn,
                              );
                            },
                      child: Text("Geri"),
                    ),

                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: currentIndex == 2
                          ? null
                          : () {
                              pageController.nextPage(
                                duration: Duration(seconds: 2),
                                curve: Curves.easeIn,
                              );
                            },
                      child: Text("İleri"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Yatay Eksen"),
                    Checkbox(
                      value: yatayEksen,
                      onChanged: (val) {
                        setState(() {
                          yatayEksen = val!;
                        });
                      },
                    ),
                    Text("Page Snipped"),
                    Checkbox(
                      value: isPageSnapping,
                      onChanged: (val) {
                        setState(() {
                          isPageSnapping = val!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
