import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:goodnewsapp/common/ui/custom_card.dart';

class OverlayCard extends StatelessWidget {
  final String title, contentPreview, oArticleURL, imageUrl;

  OverlayCard({
    this.imageUrl,
    @required this.title,
    @required this.contentPreview,
    @required this.oArticleURL,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCard(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomCardTitle(
                      title: title,
                      color: Colors.white,
                      mainAxisAlignment: MainAxisAlignment.start,
                      shadow: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(contentPreview),
              ),
              ListTile(
                leading: Icon(Icons.web),
                title: Text('View full article'),
                trailing: Icon(Icons.arrow_right),
                onTap: null,
              )
            ],
          ),
        ),
      ],
    );
  }
}
