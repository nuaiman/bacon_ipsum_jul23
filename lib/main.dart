import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bacon_ipsum/providers/bacon_ipsum_provider.dart';
import 'bacon_ipsum/screens/bacon_ipsum_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BaconIpsumProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bacon Ipsums',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const BaconIpsumListScreen(),
      ),
    );
  }
}
