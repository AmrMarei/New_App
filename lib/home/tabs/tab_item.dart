import 'package:flutter/material.dart';
import 'package:news_app/home/app_colors.dart';
import 'package:news_app/model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;

  Source source;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primaryLightColor,
            width: 2,
          ),
          color: isSelected ? AppColors.primaryLightColor : Colors.transparent),
      child: Text(source.name ?? "",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isSelected
                    ? AppColors.whiteColor
                    : AppColors.primaryLightColor,
              )),
    );
  }
}
