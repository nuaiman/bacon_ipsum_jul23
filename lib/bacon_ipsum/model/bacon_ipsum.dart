class BaconIpsum {
  final String text;
  final String image;

  BaconIpsum({
    required this.text,
    required this.image,
  });

  BaconIpsum copyWith({
    String? text,
    String? image,
  }) {
    return BaconIpsum(
      text: text ?? this.text,
      image: image ?? this.image,
    );
  }
}
