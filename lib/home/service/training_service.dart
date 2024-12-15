import '../widget/widget.dart';

final List<CarouselCard> carouselCards = [
  CarouselCard(
    carouselCardInfo: CarouselCardInfo(
      training: 'ChatGPT & Gemini',
      description: 'Ultimate ChatGPT, MJ, Gemini course for digital marketers.',
      image: 'content_based_color_scheme_1.png',
      originalPrice: 899,
      discountedPrice: 499,
    ),
  ),
  CarouselCard(
    carouselCardInfo: CarouselCardInfo(
      training: 'AWS Certified Cloud Practitioner',
      description:
          'Full Practice Exam included + explanations | Learn Cloud Computing | Pass the AWS Cloud Practitioner CLF-C02 exam!',
      image: 'content_based_color_scheme_2.png',
      originalPrice: 899,
      discountedPrice: 449,
    ),
  ),
  CarouselCard(
    carouselCardInfo: CarouselCardInfo(
      training: 'Complete Web Development Bootcamp',
      description:
          'Become a Full-Stack Web Developer with just ONE course. HTML, CSS, Javascript, Node, React, PostgreSQL, Web3 and DApps',
      image: 'content_based_color_scheme_3.png',
      originalPrice: 999,
      discountedPrice: 699,
    ),
  ),
  CarouselCard(
    carouselCardInfo: CarouselCardInfo(
      training: 'Microsoft Power BI Desktop',
      description:
          'Master Power BI Desktop for data prep, data analysis, data visualization &amp; dashboard design w/ top Power BI instructors!',
      image: 'content_based_color_scheme_4.png',
      originalPrice: 899,
      discountedPrice: 399,
    ),
  ),
  CarouselCard(
    carouselCardInfo: CarouselCardInfo(
      training: 'Probability & Statistics Master',
      description:
          'Learn everything from Probability & Statistics, then test your knowledge with 600+ practice questions',
      image: 'content_based_color_scheme_5.png',
      originalPrice: 899,
      discountedPrice: 499,
    ),
  ),
  CarouselCard(
    carouselCardInfo: CarouselCardInfo(
      training: 'R Programming For Data Science',
      description:
          'Learn Programming In R And R Studio. Data Analytics, Data Science, Statistical Analysis, Packages, Functions, GGPlot2',
      image: 'content_based_color_scheme_6.png',
      originalPrice: 899,
      discountedPrice: 499,
    ),
  ),
];

final List<TrainingCardViewInfo> trainingCards = [
  TrainingCardViewInfo(
    trainingStartDateTime: DateTime.now(),
    trainingEndDateTime: DateTime.now().add(Duration(days: 1, hours: 7)),
    trainingLocation: 'Convention Hall, Chennai',
    trainingName: 'Safe Scrum Master (4.6)',
    trainerImageUrl:
        'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
    trainerName: 'Helen Gribble',
  ),
  TrainingCardViewInfo(
    trainingStartDateTime: DateTime.now(),
    trainingEndDateTime:
        DateTime.now().add(Duration(days: 1, hours: 1, minutes: 10)),
    trainingLocation: 'Convention Hall, Mumbai',
    trainingName: 'New Flutter 3.27',
    trainerImageUrl:
        'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
    trainerName: 'Girish Batkar',
  ),
  TrainingCardViewInfo(
    trainingStartDateTime: DateTime.now().add(Duration(days: 1)),
    trainingEndDateTime:
        DateTime.now().add(Duration(days: 2, hours: 1, minutes: 10)),
    trainingLocation: 'Convention Hall, Mumbai',
    trainingName: 'Method Channel',
    trainerImageUrl:
        'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
    trainerName: 'Vikash Kumar',
  ),
  TrainingCardViewInfo(
    trainingStartDateTime: DateTime.now(),
    trainingEndDateTime: DateTime.now().add(Duration(days: 1, hours: 10)),
    trainingLocation: 'Convention Hall, Kolkata',
    trainingName: 'New Flutter 3.27',
    trainerImageUrl:
        'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
    trainerName: 'Devyank Shaw',
  ),
  TrainingCardViewInfo(
    trainingStartDateTime: DateTime.now(),
    trainingEndDateTime:
        DateTime.now().add(Duration(days: 1, hours: 1, minutes: 10)),
    trainingLocation: 'Convention Hall, Mumbai',
    trainingName: 'Flutter State Management',
    trainerImageUrl:
        'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
    trainerName: 'Girish Batkar',
  ),
];
