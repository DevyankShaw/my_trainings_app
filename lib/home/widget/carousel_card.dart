import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.carouselCardInfo,
  });

  final CarouselCardInfo carouselCardInfo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        ClipRect(
          child: OverflowBox(
            maxWidth: width * 0.9,
            minWidth: width * 0.9,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/material/${carouselCardInfo.image}'),
            ),
          ),
        ),
        SizedBox(
          width: (width * 0.90) - 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                carouselCardInfo.training,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: textTheme.headlineMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 6),
              Text(
                carouselCardInfo.description,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '\$${carouselCardInfo.originalPrice}',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '\$${carouselCardInfo.discountedPrice}',
                        style: textTheme.bodyMedium?.copyWith(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: null,
                    label: Text(
                      'View Details',
                      style:
                          textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    iconAlignment: IconAlignment.end,
                    icon: Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CarouselCardInfo {
  final String training;
  final String description;
  final String image;
  final double originalPrice;
  final double discountedPrice;

  CarouselCardInfo({
    required this.training,
    required this.description,
    required this.image,
    required this.originalPrice,
    required this.discountedPrice,
  });
}
