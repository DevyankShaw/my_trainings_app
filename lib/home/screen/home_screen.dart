import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/training_provider.dart';
import '../service/service.dart';
import '../widget/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Trainings',
          style: textTheme.displayMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselLayout(
            onTap: (carouselCard) {},
            carouselCards: carouselCards,
          ),
          OutlinedButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(),
                backgroundColor: Colors.white,
                builder: (modalContext) {
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
                              style: textTheme.headlineSmall
                                  ?.copyWith(color: Colors.black),
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
                      Consumer<TrainingProvider>(
                        builder: (context, value, child) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Column(
                                  children: value.filters.keys
                                      .map((selectionLabel) =>
                                          FilterSelectionLabel(
                                            label: selectionLabel,
                                            isSelected:
                                                value.selectedFilterLabel ==
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
                                  filterSelectionViewInfos:
                                      value.filters[value.selectedFilterLabel]
                                              ?.map(
                                                (selectionValue) =>
                                                    FilterSelectionViewInfo(
                                                  label: selectionValue,
                                                  isSelected: value
                                                          .selectedFilters[value
                                                              .selectedFilterLabel]
                                                          ?.contains(
                                                              selectionValue) ??
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
                    ],
                  );
                },
              );
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
          Consumer<TrainingProvider>(
            builder: (_, trainingProvider, __) {
              return Expanded(
                child: ListView.separated(
                  itemCount: trainingProvider.filteredTrainings.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16),
                  padding: EdgeInsets.all(16),
                  itemBuilder: (_, index) {
                    return TrainingCardView(
                      onTap: () {},
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
}
