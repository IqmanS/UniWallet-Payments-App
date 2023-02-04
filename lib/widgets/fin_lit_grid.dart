import 'package:fampay_hack/provider/fin_lit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FinLitGrid extends StatefulWidget {
  const FinLitGrid({super.key});

  @override
  State<FinLitGrid> createState() => _FinLitGridState();
}

class _FinLitGridState extends State<FinLitGrid> {
  @override
  void initState() {
    Provider.of<FinLit>(context, listen: false).fetchAndSetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final finData = Provider.of<FinLit>(context);
    final extractedNews = finData.news as List<News>;
    final newsLength = finData.news.length;
    return Container(
      height: 200,
      child: newsLength == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: finData.news.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (2 / 3), crossAxisCount: 1),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          extractedNews[index].urlToImage!,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      ),
                      Container(
                        color: Colors.black87,
                        height: 38,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Center(
                            child: Text(
                              extractedNews[index].title,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
