class AtricleModel {
  final String? image;
  final String title;
  final String? subTitle;
  final String? creator;
  final String? pubDate;
  final String? sourceName;
  final String? sourceUrl;

  AtricleModel({
    this.image,
    required this.title,
    this.subTitle,
    this.creator,
    this.pubDate,
    this.sourceName,
    this.sourceUrl,
  });

  factory AtricleModel.fromJson(Map<String, dynamic> json) {
    return AtricleModel(
      image: json['image_url'],
      title: json['title'] ?? '',
      subTitle: json['description'],
      // handle List<String> or null safely
      creator: (json['creator'] is List && json['creator'].isNotEmpty)
          ? json['creator'][0]
          : null,
      pubDate: json['pubDate'],
      sourceName: json['source_name'], // ✅ correct field
      sourceUrl: json['source_url'], // ✅ correct field
    );
  }
}
