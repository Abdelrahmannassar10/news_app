import 'package:flutter/material.dart';
import 'package:news_app_nassar/models/atricle_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Newsviewer extends StatelessWidget {
  const Newsviewer({super.key, required this.articleModel});

  final AtricleModel articleModel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Nassar News',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                articleModel.image ?? '',
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 220,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              articleModel.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 12),

            // Subtitle / Description
            if (articleModel.subTitle != null)
              Text(
                articleModel.subTitle!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.4,
                    ),
              ),
            const SizedBox(height: 16),

            // Meta info (Date + Author)
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 6),
                Text(
                  articleModel.pubDate ?? "Unknown date",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                const SizedBox(width: 16),
                Icon(Icons.person, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 6),
                Text(
                  articleModel.creator ?? "Unknown author",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Source info
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.public, color: Colors.blue),
                title: Text(
                  articleModel.sourceName ?? "Unknown Source",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(articleModel.sourceUrl ?? ""),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
