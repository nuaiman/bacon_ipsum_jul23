import 'dart:async';

import 'package:flutter/material.dart';

import '../model/bacon_ipsum.dart';
import '../apis/api_service.dart';

class BaconIpsumProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<BaconIpsum> _listItems = [];
  List<BaconIpsum> get listItems => _listItems;

  final StreamController<List<BaconIpsum>> _listController =
      StreamController<List<BaconIpsum>>();
  Stream<List<BaconIpsum>> get listStream => _listController.stream;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  BaconIpsumProvider() {
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    _isLoading = true;
    notifyListeners();
    _listItems = await _fetchData();
    _listController.add(_listItems);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMoreData() async {
    final newData = await _fetchData();
    _listItems.addAll(newData);
    _listController.add(_listItems);
  }

  Future<List<BaconIpsum>> _fetchData() async {
    final baconIpsumList = await apiService.fetchBaconIpsum();
    final newData = baconIpsumList
        .map((text) =>
            BaconIpsum(text: text, image: apiService.generateRandomImage()))
        .toList();
    return newData;
  }
}
