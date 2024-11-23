import 'package:flutter/material.dart';
import 'package:news_app/home/app_colors.dart';

class Category {
  String id;

  String title;

  String imagePath;

  Color color;

  Category(
      {required this.id, required this.title, required this.imagePath, required this.color});

  static List<Category> getCategories() {
    return [
      Category(id: 'sports', title: 'Sports',
          imagePath: 'assets/image/sports.png', color: AppColors.redColor),
      Category(id: 'general',
          title: 'Politics',
          imagePath: 'assets/image/Politics.png',
          color: AppColors.darkBlueColor),
      Category(id: 'health', title: 'Health',
          imagePath: 'assets/image/health.png', color: AppColors.pinkColor),
      Category(id: 'business', title: 'Business',
          imagePath: 'assets/image/bussines.png', color: AppColors.brownColor),
      Category(id: 'entertainment',
          title: 'Environment',
          imagePath: 'assets/image/environment.png',
          color: AppColors.blueColor),
      Category(id: 'science', title: 'Science',
          imagePath: 'assets/image/science.png', color: AppColors.yellowColor),
    ];
  }
}