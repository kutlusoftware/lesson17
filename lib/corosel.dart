import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> imageList;
  final double height;

  const CustomCarousel({super.key, required this.imageList, this.height = 150});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageList.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.imageList[index],
                    fit: BoxFit.cover,
                    width: double.infinity, //Ekran genişliği boyunca
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        // ...existing code...
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.imageList.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.blue
                    : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
        // ...existing code...
      ],
    );
  }
}
