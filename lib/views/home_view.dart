import 'package:flutter/material.dart';
import 'package:news_app_nassar/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:news_app_nassar/components/category_listview.dart';
import 'package:news_app_nassar/components/news_listview_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("News", style: TextStyle(color: textColor)),
            const Text("Cloud", style: TextStyle(color: Colors.orange)),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: const [
          SliverToBoxAdapter(child: category_listview()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          NewsListviewBuilder(category: "world"),
        ],
      ),
    );
  }
}
