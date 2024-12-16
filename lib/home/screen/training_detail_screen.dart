import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_trainings_app/home/widget/training_card_view.dart';

class TrainingDetailScreen extends StatelessWidget {
  const TrainingDetailScreen({super.key, required this.trainingCardViewInfo});

  final TrainingCardViewInfo trainingCardViewInfo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: Text(
          'Training Detail',
          style: textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Text(
            trainingCardViewInfo.trainingName,
            style: textTheme.headlineMedium?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 18),
          Text(
            '${DateFormat('MMM dd').format(trainingCardViewInfo.trainingStartDateTime)} - ${DateFormat('dd, yyyy').format(trainingCardViewInfo.trainingEndDateTime)}',
            style: textTheme.headlineSmall
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '${DateFormat('hh:mm a').format(trainingCardViewInfo.trainingStartDateTime)} - ${DateFormat('hh:mm a').format(trainingCardViewInfo.trainingEndDateTime)}',
            softWrap: false,
            style: textTheme.bodyMedium?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            trainingCardViewInfo.trainingLocation,
            style: textTheme.labelMedium
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image(
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                  image: NetworkImage(
                    trainingCardViewInfo.trainerImageUrl,
                  ),
                ),
              ),
              SizedBox(width: 16),
              RichText(
                text: TextSpan(
                  text: 'Keynote Speaker\n',
                  style: textTheme.labelMedium?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: trainingCardViewInfo.trainerName,
                      style: textTheme.bodyMedium
                          ?.copyWith(color: Colors.black, fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
