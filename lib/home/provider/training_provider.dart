import 'package:flutter/foundation.dart';

import '../widget/training_card_view.dart';

class TrainingProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<TrainingCardViewInfo> _trainings = [];
  final List<TrainingCardViewInfo> _filteredTrainings = [];
  final Map<String, Set<String>> _filters = {};
  final Map<String, Set<String>> _selectedFilters = {};
  String _selectedFilterLabel = '';

  TrainingProvider(List<TrainingCardViewInfo> trainingData) {
    _trainings.addAll(trainingData);
    _filteredTrainings.addAll(trainingData);
    _filters.putIfAbsent('Location', () => {});
    _filters.putIfAbsent('Training Name', () => {});
    _filters.putIfAbsent('Trainer', () => {});
    _selectedFilters.putIfAbsent('Location', () => {});
    _selectedFilters.putIfAbsent('Training Name', () => {});
    _selectedFilters.putIfAbsent('Trainer', () => {});
    for (final data in trainingData) {
      _filters['Location']?.add(data.trainingLocation.split(',').last.trim());
      _filters['Training Name']?.add(data.trainingName);
      _filters['Trainer']?.add(data.trainerName);
    }
    _selectedFilterLabel = _filters.keys.first;
  }

  List<TrainingCardViewInfo> get filteredTrainings => _filteredTrainings;
  Map<String, Set<String>> get filters => _filters;
  Map<String, Set<String>> get selectedFilters => _selectedFilters;
  String get selectedFilterLabel => _selectedFilterLabel;

  void setSelectedFilterLabel(String label) {
    _selectedFilterLabel = label;
    notifyListeners();
  }

  void updateSelectedFilter(bool value, String label) {
    if (value) {
      _selectedFilters[_selectedFilterLabel]?.add(label);
    } else {
      _selectedFilters[_selectedFilterLabel]?.remove(label);
    }
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('filteredTrainings', filteredTrainings));
    properties.add(StringProperty('selectedFilterLabel', selectedFilterLabel));
  }
}
