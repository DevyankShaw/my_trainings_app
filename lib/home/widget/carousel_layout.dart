import 'dart:math';

import 'package:flutter/material.dart';
import 'carousel_card.dart';

class CarouselLayout extends StatefulWidget {
  const CarouselLayout(
      {super.key, required this.carouselCards, required this.onTap});

  final List<CarouselCard> carouselCards;
  final Function(CarouselCard) onTap;

  @override
  State<CarouselLayout> createState() => _CarouselLayoutState();
}

class _CarouselLayoutState extends State<CarouselLayout> {
  final controller = CarouselController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: max(height / 5, 150)),
          child: CarouselView.weighted(
            enableSplash: false,
            controller: controller,
            itemSnapping: true,
            flexWeights: [1],
            shrinkExtent: width,
            shape: BeveledRectangleBorder(),
            children: widget.carouselCards
                .map(
                  (carouselCard) => GestureDetector(
                    onTap: () => widget.onTap.call(carouselCard),
                    child: carouselCard,
                  ),
                )
                .toList(),
          ),
        ),
        Positioned(
          right: 0,
          top: max(height / 5, 150) * 0.25,
          bottom: max(height / 5, 150) * 0.25,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 20,
              color: Colors.black12,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: max(height / 5, 150) * 0.25,
          bottom: max(height / 5, 150) * 0.25,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 20,
              color: Colors.black12,
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
