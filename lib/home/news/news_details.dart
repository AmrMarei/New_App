import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_colors.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'news_details';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute
        .of(context)!
        .settings
        .arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title ?? ""),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                fit: BoxFit.fill,
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator(
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
            SizedBox(height: 10,),
            Text(news.author ?? "", style: Theme
                .of(context)
                .textTheme
                .titleSmall!
                .copyWith(
                color: AppColors.greyColor
            ),),
            SizedBox(height: 10,),
            Text(news.title ?? "", style: Theme
                .of(context)
                .textTheme
                .titleMedium),
            SizedBox(height: 10,),
            Text(news.publishedAt ?? "", textAlign: TextAlign.end, style: Theme
                .of(context)
                .textTheme
                .titleSmall!
                .copyWith(
                color: AppColors.greyColor
            )),
            SizedBox(height: 10,),
            Text(news.content ?? "", style: Theme
                .of(context)
                .textTheme
                .titleSmall!
                .copyWith(
                color: AppColors.greyColor
            ),),
            SizedBox(height: 10,),
            Spacer(),
            InkWell(
              onTap: () {
                _launchUrl(news.url ?? "");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {
                    _launchUrl(news.url ?? "");
                  }, child: Text('View Full Article', style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,)),
                  Icon(Icons.arrow_forward_ios_outlined, size: 20,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(newsUrl) async {
    final Uri _url = Uri.parse(newsUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
