import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrainingCardView extends StatelessWidget {
  const TrainingCardView({
    super.key,
    required this.trainingCardViewInfo,
    required this.onTap,
  });

  final TrainingCardViewInfo trainingCardViewInfo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).width;
    return Card(
      color: Colors.white,
      elevation: 8,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: min((width - 16) * 0.30, 210),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${DateFormat('MMM dd').format(trainingCardViewInfo.trainingStartDateTime)} - ${DateFormat('dd, yyyy').format(trainingCardViewInfo.trainingEndDateTime)}',
                          style: textTheme.headlineSmall?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${DateFormat('hh:mm a').format(trainingCardViewInfo.trainingStartDateTime)} - ${DateFormat('hh:mm a').format(trainingCardViewInfo.trainingEndDateTime)}',
                          softWrap: false,
                          style: textTheme.bodyMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 42),
                        Text(
                          trainingCardViewInfo.trainingLocation,
                          style: textTheme.labelMedium?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Filling Fast!',
                            style: textTheme.labelMedium?.copyWith(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            trainingCardViewInfo.trainingName,
                            style: textTheme.headlineSmall?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
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
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Keynote Speaker\n',
                                    style: textTheme.labelMedium?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: trainingCardViewInfo.trainerName,
                                        style: textTheme.bodyMedium?.copyWith(
                                            color: Colors.black, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 14,
            bottom: 8,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.all(12),
              ),
              child: Text(
                'Enrol Now',
                style: textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrainingCardViewInfo {
  final DateTime trainingStartDateTime;
  final DateTime trainingEndDateTime;
  final String trainingLocation;
  final String trainingName;
  final String trainerImageUrl;
  final String trainerName;

  TrainingCardViewInfo({
    required this.trainingStartDateTime,
    required this.trainingEndDateTime,
    required this.trainingLocation,
    required this.trainingName,
    required this.trainerImageUrl,
    required this.trainerName,
  });
}
