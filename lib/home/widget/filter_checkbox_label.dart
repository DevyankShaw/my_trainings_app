import 'package:flutter/material.dart';

class FilterCheckboxLabel extends StatelessWidget {
  const FilterCheckboxLabel({
    super.key,
    this.isSelected = false,
    required this.label,
    required this.onChanged,
  });

  final bool isSelected;
  final String label;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Theme(
      data: ThemeData(
        checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
              fillColor: WidgetStateProperty.all(
                  isSelected ? Colors.redAccent : Colors.white),
              side: BorderSide(color: Colors.grey.shade400),
            ),
      ),
      child: CheckboxMenuButton(
        value: isSelected,
        onChanged: onChanged,
        style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            label,
            style: textTheme.labelMedium?.copyWith(
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : null,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
