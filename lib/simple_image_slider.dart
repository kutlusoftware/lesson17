import 'package:flutter/material.dart';

class SimpleImageSlider extends StatefulWidget {
  const SimpleImageSlider({super.key});

  @override
  State<SimpleImageSlider> createState() => _SimpleImageSliderState();
}

class _SimpleImageSliderState extends State<SimpleImageSlider> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  final List<String> imageUrls = [
    "https://picsum.photos/id/1011/800/400",
    "https://picsum.photos/id/1012/800/400",
    "https://picsum.photos/id/1015/800/400",
    "https://picsum.photos/id/1016/800/400",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: PageView.builder(
            itemCount: imageUrls.length,
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imageUrls.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Colors.blue
                    : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
