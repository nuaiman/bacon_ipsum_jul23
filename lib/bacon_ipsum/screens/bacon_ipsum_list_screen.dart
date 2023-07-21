import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bacon_ipsum_provider.dart';
import '../model/bacon_ipsum.dart';
import '../widgets/bacon_item.dart';

class BaconIpsumListScreen extends StatefulWidget {
  const BaconIpsumListScreen({super.key});

  @override
  State<BaconIpsumListScreen> createState() => _BaconIpsumListScreenState();
}

class _BaconIpsumListScreenState extends State<BaconIpsumListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<BaconIpsumProvider>(context, listen: false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        provider.fetchMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BaconIpsumProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bacon Ipsums'),
      ),
      body: StreamBuilder<List<BaconIpsum>>(
        stream: provider.listStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading data.'),
            );
          } else {
            return ListView.builder(
              controller: _scrollController,
              itemCount: snapshot.data!.length + 1, // +1 for loading item
              itemBuilder: (context, index) {
                if (index < snapshot.data!.length) {
                  final baconIpsum = snapshot.data![index];

                  return BaconItem(
                    item: BaconIpsum(
                      text: baconIpsum.text,
                      image: baconIpsum.image,
                    ),
                  );
                } else {
                  // Loading item
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
