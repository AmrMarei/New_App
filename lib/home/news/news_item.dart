import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';

import '../app_colors.dart';
import 'news_details.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(NewsDetails.routeName, arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            // Container(
            //   clipBehavior: Clip.antiAlias,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25),
            //
            //   ),
            //   child: Image.network(news.urlToImage??""),
            // ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.greyColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(news.title ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 10,
            ),

            Text(news.publishedAt ?? "",
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColors.greyColor)),
          ],
        ),
      ),
    );
  }
}
