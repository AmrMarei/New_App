import 'package:flutter/material.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/home/tabs/tab_item.dart';
import 'package:news_app/model/SourceResponse.dart';

class TabsWidget extends StatefulWidget {
  List<Source> sourcesList;

  TabsWidget({required this.sourcesList});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourcesList
                  .map((source) => TabItem(
                        source: source,
                        isSelected:
                            selectedIndex == widget.sourcesList.indexOf(source),
                      ))
                  .toList()),
          Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}
