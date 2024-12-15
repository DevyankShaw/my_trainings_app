import 'package:flutter/material.dart';

class FilterSelectionLabel extends StatelessWidget {
  const FilterSelectionLabel({
    super.key,
    this.isSelected = false,
    required this.label,
    required this.onTap,
  });

  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSelected ? Colors.white : Colors.grey.shade200,
        height: 60,
        child: Row(
          children: [
            if (isSelected) Container(color: Colors.redAccent, width: 8),
            Padding(
              padding: EdgeInsets.only(
                left: isSelected ? 30 : 38,
                right: isSelected ? 30 : 38,
              ),
              child: Text(
                label,
                style: textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : null,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
