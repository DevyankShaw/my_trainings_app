import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/training_provider.dart';
import '../service/service.dart';
import '../widget/widget.dart';
import 'training_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Trainings',
          style: textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          CarouselLayout(
            onTap: (carouselCard) {},
            carouselCards: carouselCards,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: OutlinedButton.icon(
              onPressed: () {
                openModalSheet(context, textTheme);
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                side: const BorderSide(color: Colors.grey),
              ),
              label: Text(
                'Filter',
                style: textTheme.titleSmall
                    ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              icon: Icon(
                Icons.filter_alt_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          Consumer<TrainingProvider>(
            builder: (_, trainingProvider, __) {
              return Expanded(
                child: ListView.separated(
                  itemCount: trainingProvider.filteredTrainings.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12),
                  padding: EdgeInsets.all(12),
                  itemBuilder: (_, index) {
                    return TrainingCardView(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrainingDetailScreen(
                              trainingCardViewInfo:
                                  trainingProvider.filteredTrainings[index],
                            ),
                          ),
                        );
                      },
                      trainingCardViewInfo:
                          trainingProvider.filteredTrainings[index],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future<dynamic> openModalSheet(BuildContext context, TextTheme textTheme) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(),
      backgroundColor: Colors.white,
      builder: (modalContext) {
        final width = MediaQuery.sizeOf(context).width;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 16,
                right: 6,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort and Filters',
                    style:
                        textTheme.headlineSmall?.copyWith(color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(modalContext);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              height: 0,
            ),
            Expanded(
              child: Consumer<TrainingProvider>(
                builder: (context, value, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: min(width * 0.35, 200),
                        child: Column(
                          children: value.filters.keys
                              .map((selectionLabel) => FilterSelectionLabel(
                                    label: selectionLabel,
                                    isSelected: value.selectedFilterLabel ==
                                        selectionLabel,
                                    onTap: () {
                                      context
                                          .read<TrainingProvider>()
                                          .setSelectedFilterLabel(
                                              selectionLabel);
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
                      Expanded(
                        child: FilterSelectionView(
                          selectedFilterLabel: value.selectedFilterLabel,
                          filterSelectionViewInfos:
                              value.filters[value.selectedFilterLabel]
                                      ?.map(
                                        (selectionValue) =>
                                            FilterSelectionViewInfo(
                                          label: selectionValue,
                                          isSelected: value.selectedFilters[
                                                      value.selectedFilterLabel]
                                                  ?.contains(selectionValue) ??
                                              false,
                                        ),
                                      )
                                      .toList() ??
                                  [],
                          onCheckboxLabelChanged: (value, label) {
                            context
                                .read<TrainingProvider>()
                                .updateSelectedFilter(value, label);
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
