import 'package:flutter/material.dart';

import '../model/bacon_ipsum.dart';

class BaconItem extends StatelessWidget {
  const BaconItem({
    super.key,
    required this.item,
  });

  final BaconIpsum item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 100,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder.jpg',
                    image: item.image,
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.text,
                  maxLines: 20,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
