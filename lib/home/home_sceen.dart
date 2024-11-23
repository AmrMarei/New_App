import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/app_colors.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/home/search/search_screen.dart';
import 'package:news_app/home/settings/setting.dart';
import 'package:news_app/home/tabs/tabs_widget.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/category.dart';

import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            'assets/image/back_ground.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedMenuItem == HomeDrawer.settings
                  ? 'Setting'
                  : selectedCategory == null
                      ? 'News'
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                onPressed: () =>
                    showSearch(context: context, delegate: SearchScreen()),
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(
              onSideMenuItemClick: onSideMenuItemClick,
            ),
          ),
          body: selectedMenuItem == HomeDrawer.settings
              ? SettingTab()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryItemClick: onCategoryItemClick,
                    )
                  : CategoryDetails(
                      category: selectedCategory!,
                    ),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSideMenuItem) {
    selectedMenuItem = newSideMenuItem;
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }
}
