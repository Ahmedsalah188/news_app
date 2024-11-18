import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/my_theme.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "news.author??",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.greyColor),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "news.title??",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "news.publishedAt??",
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: MyTheme.greyColor,
                ),
          ),
        ],
      ),
    );
  }
}
