import 'package:flutter/material.dart';

import 'filter_checkbox_label.dart';

class FilterSelectionView extends StatefulWidget {
  const FilterSelectionView({
    super.key,
    required this.filterSelectionViewInfos,
    required this.onCheckboxLabelChanged,
  });

  final List<FilterSelectionViewInfo> filterSelectionViewInfos;
  final Function(bool value, String label) onCheckboxLabelChanged;

  @override
  State<FilterSelectionView> createState() => _FilterSelectionViewState();
}

class _FilterSelectionViewState extends State<FilterSelectionView> {
  final controller = TextEditingController();
  final copyFilterSelectionViewInfos = <FilterSelectionViewInfo>[];

  @override
  void initState() {
    copyFilterSelectionViewInfos
      ..clear()
      ..addAll(widget.filterSelectionViewInfos);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FilterSelectionView oldWidget) {
    controller.clear();
    copyFilterSelectionViewInfos
      ..clear()
      ..addAll(widget.filterSelectionViewInfos);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        top: 8.0,
        bottom: 8.0,
        right: 16.0,
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
            cursorColor: Colors.grey.shade800,
            onChanged: (value) {
              if (value.isNotEmpty) {
                copyFilterSelectionViewInfos
                  ..clear()
                  ..addAll(widget.filterSelectionViewInfos
                      .where((data) => data.label
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList());
              } else {
                copyFilterSelectionViewInfos
                  ..clear()
                  ..addAll(widget.filterSelectionViewInfos);
              }
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: textTheme.titleSmall
                  ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade800)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Column(
              children: copyFilterSelectionViewInfos
                  .map(
                    (info) => FilterCheckboxLabel(
                      isSelected: info.isSelected,
                      label: info.label,
                      onChanged: (value) => widget.onCheckboxLabelChanged
                          .call(value ?? false, info.label),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterSelectionViewInfo {
  final String label;
  bool isSelected;

  FilterSelectionViewInfo({
    required this.label,
    this.isSelected = false,
  });
}
